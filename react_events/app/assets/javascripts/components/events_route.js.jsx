/*
    Route: Events
    Root Query to fetch events collection
    params: {}

*/

var EventsRoute = {
    queries: {
        root: () => Relay.QL`
            query {
                root
            }    
        `,
    },
    params: {

    },
    name: 'EventsRoute'
}

module.exports = EventsRoute;