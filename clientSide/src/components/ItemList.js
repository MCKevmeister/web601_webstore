import LimitedItemDetail from "./LimitedItemDetail";
import React, {useEffect, useState} from "react";

function ItemList() {

    const [items, setItems] =useState([]);

    useEffect(() => {
        return () => {
            fetch("https://localhost:8080/product")
                .then((res) => res.json())
                .then(products => {
                    setItems(products)
                })
            }
        },[])

    return (
        <div className="w-full bg-white p-12">
            <div className="header flex items-end justify-between mb-12">
                <div className="title">
                    <p className="text-4xl font-bold text-gray-800 mb-4">
                        Products
                    </p>
                </div>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-12">
                {
                    items.map ( (item) => (
                        <LimitedItemDetail
                            key={item.ProductID}
                            itemName={item.ProductName}
                            itemDescription={item.Description}
                            itemPrice={item.Price}
                        />
                    ) )
                }
            </div>
        </div>
    )
}

export default ItemList;

