/* 
    Component: React Application
    Renders events leveraging React API
*/

class Events extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
        const {root} = this.props;

        return (
            <div className="container">
            <table className="table table-striped">
            <thead>
                <tr>
                    <th className="col-md-3">Name</th>
                    <th className="col-md-2">Date</th>
                    <th className="col-md-3">Place</th>
                    <th className="col-md-4">Description</th>

                </tr>
            </thead>
            <tbody>
                        {root.events.edges.map(({node}) => (
                             <EventPreview key={'event' + node.id}
                                    event={node} />
                        ))}
                  </tbody>
            </table>

            { this.state.loading ? <div className="loadmore">
                <span className="fa fa-spin fa-spinner"></span>
                </div> : ''}
            { this.state.done ? <div className="loadmore-done">
                <p>completed </p>
                </div> : ''}
            </div>
        );
    }
}

module.exports = Events;

var EventsContainer = Relay.createContainer(Events, {
    initialVariables: {
        count:20,
        order: "-id"
    },
    fragments: {
        root: () => Relay.QL`
            fragment on Viewer {
                id, 
                events(first: $count, order: $order) {
                    edges {
                        node {
                            id,
                            ${EventPreview.getFragment('event')}
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

module.exports = EventsContainer;