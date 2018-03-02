var NewItem = createReactClass({

    handleClick: function() {
        var name= this.name.value;
        var description = this.description.value;
        console.log(name);
        console.log(description);
        $.ajax({
            url: 'api/v1/items',
            type: 'POST',
            data: { item: {name:name, description:description}},
            success: (response) => {
                console.log('success!', response);
            }
        })
    },

    render: function () {

        return (
            <div>
                <input placeholder = "Enter Name" ref={(input) => this.name = input} />

                <input ref={(input) => this.description = input}  placeholder='Enter a description' />
                <button onClick={this.handleClick}>Submit</button>
            </div>
        )
    }
})