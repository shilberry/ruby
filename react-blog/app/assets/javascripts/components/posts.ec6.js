var React = require('react')
var Relay = require('react-relay')
var PostPreview = require('./post_preview.es6.js')

/* 
    Component: Posts
    Renders a collection of posts

    */

class Posts extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        const {root} = this.props;
        return(
            <div className ="container">
                <div className="row">
                    <div className="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset1">
                        {root.posts.edges.map(({node}) => 
                                <PostPreview key={node.id} post={node} root={root} />                            )
                        }
                    </div>
                </div>
                {
                    this.state.loading ?  <div className="loadmore">
                        <span className="fa fa-spin fa-spinner" />
                    </div> : ''
                }
                {
                    this.state.done ? <div className="loadmore-done">
                        <p>No more posts to load</p>
                        </div> : ''
                }
            </div>
        );
    }

}

module.exports = Posts;

/* 

    Relay Container: Posts
    Defines data schema for  component
*/

var PostContainer = Relay.createContainer(Posts, {
    intialVariables: {
        count:20,
        order: "-id"
    },
    fragments: {
        root: () => Relay.QL`
            fragment on Viewer {
                id,
                posts(first: $count, order: $order) {
                    edges {
                        node {
                            id, 
                            ${PostPreview.getFragment('post')}
                        }
                    }
                    pageInfo {
                        hasNextPage
                    }
                }
           }
        `
    }
});

module.exports = PostsContainer;