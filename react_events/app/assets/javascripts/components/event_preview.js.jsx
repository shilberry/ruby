class EventPreview extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        var {event} = this.props;

        return (
            <tr>
            <td>{event.name}</td>
            <td>{event.event_date}</td>
            <td>{event.place}</td>
            <td>{event.description}</td>
        </tr>
        )
    }
}

module.exports = EventPreview;

var EventContainer = Relay.createContainer(EventPreview, {
    initialVariables: {
        count: 1000
    },
    fragments: {
        post: () => Relay.QL`
            fragment on Event {
                name,
                event_date,
                place,
                description
            }
        `
    }
});

module.exports = EventContainer;