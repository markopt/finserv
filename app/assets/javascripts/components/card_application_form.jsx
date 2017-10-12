class CardApplicationForm extends React.Component {
  render() {
    return(
        <div className="grid-x grid-margin-x">
          <div className="cell small-10 small-offset-1">
            <div className="text-center">
              <h1>Apply For the { this.props.cardType }</h1>
            </div><hr />
            <div className="grid-x grid-margin-x">
            <form>
              <div className="form-group">
                <label for="firstNameInput">First Name</label>
                <input type="text" className="form-control" id="firstNameInput" placeholder="Enter First Name" />
              </div>
              <div className="form-group">
                <label for="lastNameInput">Last Name</label>
                <input type="text" className="form-control" id="lastNameInput" placeholder="Enter Last Name" />
              </div>
              <div className="form-group">
                <label for="ssnInput">Social Security Number</label>
                <input type="text" className="form-control" id="ssnNameInput" placeholder="XXX-XX-XXXX" />
              </div>
              <div className="form-group">
                <div className="row">
                  <div class="col-md-6">
                    <label for="streetInput">Street Address</label>
                    <input type="text" class="form-control" placeholder="Enter Street Address" />
                  </div>
                  <div className="col-md-6">
                    <label for="cityInput">City</label>
                    <input type="text" className="form-control" placeholder="Enter City" />
                  </div>
                </div>
              </div>
            <div className="form-group">
              <div className="row">
                <div class="col-md-6">
                  <label for="stateInput">State</label>
                  <input type="text" className="form-control" placeholder="Enter State" />
                </div>
                <div className="col-md-6">
                  <label for="zipInput">Zip Code</label>
                  <input type="text" className="form-control" placeholder="Enter Zip Code" />
                </div>
              </div>
            </div>
            <div className="form-group submit-div">
              <a href="/">
                <button type="submit" id="submit" className="btn btn-primary">SUBMIT</button><br />
              </a>
            </div>
          </form>
        </div>
      </div>
    );
  }
};