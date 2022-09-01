```
const App = () => {
  const [count, setCount] = useState(0)
  return (
    <>
      <button onClick={setCount(count + 1)}>+1</button>
      {count}
    </>
  )
}

export default App
```

のようなcomponentを書いた際、 `Too many re-renders` エラーが起きる。

原因はbuttonのonClickの記述により以下のようなloopが起きるから

最初の描画時にsetCountが呼び出される→countが変更される→再描画が走る→setCountが呼び出される

`onClick={setCount(count + 1)}` のように関数化すればOK
