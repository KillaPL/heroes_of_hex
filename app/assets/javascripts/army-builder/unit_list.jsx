//= require external
//= require react
//= require react_ujs
//= require components
//= require_tree .


var UnitList = React.createClass({

    addUnit: function(i) {
      this.props.addUnit(i);
    },
    selectUnit: function(i) {
      this.props.selectUnit(i);
    },
    render: function() {
    units = [];
    for(var i=0; i<this.props.units.length; i++) {
      var key = 'unit_'+i;
        units.push(
          <li key={key} onClick={this.selectUnit.bind(this,this.props.units[i].id)}> 
          <span className="badge"><button onClick={this.addUnit.bind(this,this.props.units[i].id)}>+</button></span>
          {this.props.units[i].name} (${this.props.units[i].points})
          </li>            
          )
    }

      return (
    <div className="available-units">
      <h2>Available units</h2>    
        <ul className="units">
        {units}
        </ul>
      </div>
      )
    }
  });
