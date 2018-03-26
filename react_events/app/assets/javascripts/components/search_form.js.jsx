class SearchForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {query: ''};

        this.handleSearch = this.handleSearch.bind(this);
    }
    handleSearch(e) {
        this.setState({query: e.target.value})
        query = this.state.query;
        console.log(this.state.query); 
        var self = this;
        $.ajax({
                url: '/api/events/search',
                data: {query: query},
                success: function(data) {
                        self.props.handleSearch(data);
                },
                error: function(xhr,status,data) {
                    alert('Search error', status,xhr,error);
                }
        });
    }

    render() {
        return(
            <input onChange={this.handleSearch}
                    type="text"
                    className="form-control"
                    placeholder="Type your search phrase here"
                    name="query"
                
                    />
        )
    }


}