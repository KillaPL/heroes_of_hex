//= require external
//= require react
//= require react_ujs
//= require components
//= require_tree .

var UnitDetails = React.createClass({

    render: function() {
  var range = this.props.unit.range>0?this.props.unit.range:'-';      
          return (
      	<div>       
         <h2>{this.props.unit.name}'s details</h2>
        <table>
        <thead>
            <tr>
              <th>Spd</th>
              <th>Att</th>
              <th>Def</th>
              <th>Dmg</th>
              <th>HP</th>
              <th>Ammo</th>
              <th>Range</th>
            </tr>
          </thead>
          <tbody>
          <tr>
              <td>{this.props.unit.speed}</td>
              <td>{this.props.unit.attack}</td>
              <td>{this.props.unit.defense}</td>
              <td>{this.props.unit.damage_min}-{this.props.unit.damage_max}</td>
              <td>{this.props.unit.hp}</td>
              <td>{this.props.unit.ammunition}</td>
              <td>{range}</td>          
          </tr>
          </tbody>
        </table>         
      	</div>
      )
    }
  });
