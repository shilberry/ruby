
class EventApplication extends React.Component {
    constructor(props) {
        super(props);

        this.state = {events: []};

        this.handleSearch = this.handleSearch.bind(this);
        this.handleAdd = this.handleAdd.bind(this);
        
    }

    componentDidMount() {
        this.getDataFromApi();
    }

    getDataFromApi() {
        var self = this;
        $.ajax({
            url: '/api/events',
            success:function (data) {
                self.setState({events:data});
                console.log(this.state.events);
            },
            error: function(xhr,status,error) {
                alert('Cannot get data from API: ',error);
            }
        });
    }

    handleSearch(events){
        this.setState({events:events});
        console.log(this.state.events);
    }
    handleAdd(event){
        var events = this.state.events;
        console.log(events);
        events.push(event);
        this.setState({events});
    }

    render() {
        return(
            <div className="container">
                <div className="jumbotron">
                    <h1>ReactJS Tutorial</h1>
                    <p>by MO</p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <SearchForm handleSearch={this.handleSearch} />
                    </div>
                </div>
                <div className="row">
                    <div className="col-md-12">
                        <NewForm handleAdd={this.handleAdd} />
                    </div>
                </div>
                <div className="row">
                    <div className="col-md-12">
                        <EventTable events={this.state.events} />
                    </div>
                </div>
            </div>
        );
    }
}
