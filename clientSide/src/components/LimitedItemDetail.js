import {Component} from "react";

export default class LimitedItemDetail extends Component {
    render() {
        let {itemName, itemDescription, itemPrice} = this.props;
        const handleClick = () => {
            //TODO add to cart
        };

        return (
                <div className="flex max-w-md bg-white shadow-lg rounded-lg overflow-hidden">
                    <div className="w-1/3 bg-cover bg-landscape">
                    </div>
                    <div className="w-2/3 p-4">
                        <h1 className="text-gray-900 font-bold text-2xl">
                            {itemName}
                        </h1>
                        <p className="mt-2 text-gray-600 text-sm">
                            {itemDescription}
                        </p>
                        <div className="flex item-center justify-between mt-3">
                            <h1 className="text-gray-700 font-bold text-xl">
                                {itemPrice}
                            </h1>
                            <button className="px-3 py-2 bg-gray-800 text-white text-xs font-bold uppercase rounded"
                                    onClick={handleClick}>
                                Add to Card
                            </button>
                        </div>
                    </div>
                </div>
        );
    }
}

//TODO clicking on component loads an item page
