//= require external
//= require react
//= require react_ujs
//= require components
//= require_tree .

var ArmyBuilder = React.createClass({
	getInitialState: function() {
    console.log(this.props.unit);
    console.log(this.props.roster);
	    return {roster: JSON.parse(this.props.roster),
              selectedUnit: this.props.units[0]};
	},  
    getUnitNameById: function(unit_id) {
      var units = this.props.units;
      for(var i=0; i<units.length; i++)
      {
        if(units[i].id==unit_id) return units[i].name;
      }

    },
    getUnitPriceById: function(unit_id) {
      var units = this.props.units;
      for(var i=0; i<units.length; i++)
      {
        if(units[i].id==unit_id) return units[i].points;
      }
    },  

  addUnit: function(unit) {
    var newRoster = this.state.roster;
    var unitName = this.getUnitNameById(unit);
    var costPerModel = this.getUnitPriceById(unit)
    newRoster.troops.push({unit_id: unit, unit_size: 5, total_price: 5*costPerModel, unit_name:unitName , unit_price: costPerModel});
    this.setState({roster: newRoster});
  },
  selectUnit: function(unit_id) {
      var unit=null;
      var units = this.props.units;
      for(var i=0; i<units.length; i++)
      {
        if(units[i].id==unit_id) unit=units[i];
      }
    this.setState({selectedUnit: unit});      
  },
  saveRoster: function() {
    var troops = [];
    for(var i=0; i<this.state.roster.troops.length; i++) {
      troops.push({unit_id: this.state.roster.troops[i].unit_id,
                   roster_id: this.state.roster.id,
                   unit_size: this.state.roster.troops[i].unit_size,
                   total_price: this.state.roster.troops[i].total_price})
    }

    var body = JSON.stringify({
      roster: {
        id:this.state.roster.id,
        troops_attributes:troops
      }
    })

    fetch('/rosters/'+this.state.roster.id, {
      method: 'PUT',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: body
    }).then( (response) => {
      console.log(response)
    })

    console.log(body)
  },


    render: function() {
    	var UnitListStyle = {
    		float: 'left',
		    width: '30%'
    	};
    	var RosterStyle = {
    		float: 'right',
		    width: '70%'
    	};

      return (
      	<div>
      	<div style={UnitListStyle}>
	      	<UnitList units={this.props.units} addUnit={this.addUnit} selectUnit={this.selectUnit}/>
          <UnitDetails unit={this.state.selectedUnit}/>
	    </div>
	    <div style={RosterStyle}>
	      	<Roster roster={this.state.roster} selectUnit={this.selectUnit}/>
	    </div>
      <button onClick={this.saveRoster}>Save Roster</button>
      	</div>
      )
    }
  });
