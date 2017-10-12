class CreditCardPage extends Component {
    constructor(props) {
        super(props);

        this.state = {
            data: [
                <CreditCard 
                    name={"Platinum credit card"}
                    rewards={"Earn unlimited cash back. Earn unlimited 1.5% cash back on every purchase - it's automatic. No minimum to redeem for cash back"}
                    img={"https://photos-6.dropbox.com/t/2/AACwPsJ_0-_HlwFpDoa04J_m4ftuq9nv-BPz94QfymLgmA/12/281164706/png/32x32/3/1507683600/0/2/SilverCardImage%402x.png/EP-qoMoEGPZaIAIoAg/2298qmiK7g-JFaWZpySkA8aGmaIhFOO0aSyQAULN2nM?dl=0&size=1280x960&size_mode=3"} 
                    apr={"0% intro APR for 15 months from account opening on purchases and balance transfers. After that, 15.99-24.74% variable APR"} 
                    fee={"0%"} />,
                <CreditCard 
                    name={"Gold credit card"} 
                    rewards={"Jumpstart your financial fitness. 60 day introductory balance transfer offer, save on interest, and get your free monthly credit score"}
                    img={"https://photos-2.dropbox.com/t/2/AABJo2tU3pccsbdI8WQJurifnPeipOgahV7afWpQiOV66A/12/281164706/png/32x32/3/1507683600/0/2/GoldCardImage%402x.png/EP-qoMoEGPZaIAIoAg/5kzMFF0AdzJXl_YtpP1fhLRX8iQ4YQj_-LS4s3y7Cc8?dl=0&size=1280x960&size_mode=3"} 
                    apr={"0%"} 
                    fee={"0%"} />,
                <CreditCard 
                    name={"Black credit card"} 
                    rewards={"Preimum travel & dining rewards. Earn 2x points on travel and dining at restaurants."}
                    img={"https://photos-1.dropbox.com/t/2/AAC1JMSj0wjDoP2iwajLQIEDFlac31UshK7lWB7CAdkKAg/12/281164706/png/32x32/3/1507683600/0/2/BlackCardImage%402x.png/EP-qoMoEGPZaIAIoAg/srdRHhboh8vqvz69kuPO5DsWx2ECMFQ_ICwK_zakp1U?dl=0&size=1280x960&size_mode=3"} 
                    apr={"16.99-23.99%"} 
                    fee={"0% intro annual fee for the first year, after that $95"} />
            ]
        }
    }
    
    loadAdditionalCards() {

        const additionalCards = [ <CreditCard 
                name={"Super Basic credit card"}
                rewards={"There are absolutely no rewards for this card"}
                apr={"0%"}
                fee={"0%"} />,
            <CreditCard 
                name={"Secure credit card"}
                rewards={"No rewards"}
                apr={"0%"}
                fee={"0%"} />
        ]

        let updatedCardArray = [...this.state.data, ...additionalCards];
        this.setState({ data: updatedCardArray });

        const targetElem = document.getElementById('additional-cards-button');
        targetElem.style.display = 'none';
    }

    render() {
        return(
            <div className="container">
                <div id="card-options">
                    <h1>Credit Cards</h1>
                    { this.state.data }
                    <br /><br />
                </div>
                <div className="row additional-cards-div">
                    <button type="button" id="additional-cards-button" className="btn btn-primary" onClick={this.loadAdditionalCards.bind(this)}>ADDITIONAL CARDS</button><br />
                </div>
            </div>
        );
    }
};