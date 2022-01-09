import {useEffect, useState} from "react";

export default function CategoryList() {
    function handleClick(key) {
        //TODO
    }
    const [categories, setCategories] = useState([]);

    useEffect(() => {
        return () => {
            fetch("https://localhost:8080/category")
                .then((res) => res.json())
                .then(categories => {
                    setCategories(categories)
                })
        }
    },[])

    return (
        <div className="relative bg-white dark:bg-gray-800">
            <div className="flex flex-col sm:flex-row sm:justify-around">
                <div className="w-72 mt-10 rounded-lg h-screen bg-gray-100">
                    <nav className="mt-10 px-6">
                        {
                            categories.map ( (category) => (
                                <a className="hover:text-gray-800 hover:bg-gray-100 flex items-center p-2 my-6 transition-colors dark:hover:text-white dark:hover:bg-gray-600 duration-200 text-gray-600 dark:text-gray-400 rounded-lg "
                                   href="#">
                                <span className="mx-4 text-lg font-normal">
                                    {category.CategoryName}
                                </span>
                                    <span className="flex-grow text-right" />
                                </a>
                            ))
                        }
                    </nav>
                </div>
            </div>
        </div>
    )
}


