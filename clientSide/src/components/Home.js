import Search from './Search'
import CategoryList from './CategoryList'
import ItemList from './ItemList'

function Home() {
    return (
        <div>
            <div className="w-1/4">
                <CategoryList />
            </div>
            <div>
                <Search />
                <ItemList />
            </div>
        </div>

    )
}

export default Home
