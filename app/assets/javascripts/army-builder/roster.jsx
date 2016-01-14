//= require external
//= require react
//= require react_ujs
//= require components
//= require_tree .

  var Roster = React.createClass({
	getInitialState: function() {
	    return {roster: this.props.roster};
	},  
    selectUnit: function(i) {
      this.props.selectUnit(i);
    },
	handleUnitSizeChange: function(event) {
		var newroster = this.state.roster;
		var troop = newroster.troops[event.target.name];
		troop.unit_size = event.target.value;
		troop.total_price = troop.unit_size * troop.unit_price;		
		this.setState({roster: newroster});
	},	    	
	removeUnit: function(event) {
		var newroster = this.state.roster;
		newroster.troops.splice(event.target.name,1);
		this.setState({roster: newroster});
	},
    render: function() {

    	var rost = this.state.roster;
    	var troops = [];
    	var total_price = 0;
    	for(var i=0; i<rost.troops.length; i++) {
    		var key = 'troop_'+i;
    		troops.push(
    			<tr key={key} onClick={this.selectUnit.bind(this,rost.troops[i].unit_id)}>
	    			<td><button onClick={this.removeUnit} name={i}>-</button> </td>
	    			<td><input type="number" value={rost.troops[i].unit_size} onChange={this.handleUnitSizeChange} name={i}/></td>
	    			<td>{rost.troops[i].unit_name}</td>
	    			<td>($ {rost.troops[i].total_price})</td>
    			</tr>
    			)
    		total_price+=rost.troops[i].total_price;
    	}

      return (
      	<div id='welcome'>
	        <p>Roster details: {rost.name} {rost.id}</p>
	      <table>
	     	<thead>
		      	<tr>
			        <th></th>
			        <th>Size</th>
			        <th>Type</th>
			        <th>Cost</th>
		        </tr>
	        </thead>
	        <tbody>
	        	{troops}
	        </tbody>
	      </table>
	      <p>Total price: <b>{total_price}</b></p>
	    </div>
      )
    }
  });
