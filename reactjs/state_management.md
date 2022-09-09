## 0. 通常

```
import { useState } from 'react'

const Top = () => {
  const [themeColor] = useState('dark')

  return (
    <Middle color={themeColor} />
  )
}

const Middle = (props) => {
  return (
    <Bottom color={props.color} />
  )
}

const Bottom = (props) => {
  return (
    <div>テーマカラーは {props.color} です。</div>
  )
}
```

## 1. React Context

通常使用例
```
import { useState, createContext, useContext } from 'react'

const SampleContext = createContext('light')

const Top = () => {
  const [themeColor] = useState('dark')

  return (
    <SampleContext.Provider value={themeColor}>
      <Middle />
    </SampleContext.Provider>
  )
}

const Middle = () => {
  return (
    <Bottom />
  )
}

const Bottom = () => {
  const color = useContext(SampleContext)

  return (
    <div>テーマカラーは {color} です。</div>
  )
}
```

createContext 以外のcomponentでglobal stateを更新試合場合

```hooks
import { useState } from 'react'

const useThemeColor = () => {
  const [themeColor, setThemeColor] = useState('light')

  return {
    themeColor,
    setThemeColor
  }
}

export default useThemeColor
```

```
import { createContext, useContext } from 'react'
import useThemeColor from './hooks/useThemeColor'

const SampleContext = createContext()

const Top = () => {
  return (
    <SampleContext.Provider value={useThemeColor()}>
      <Middle />
    </SampleContext.Provider>
  )
}

const Middle = () => {
  return (
    <Bottom />
  )
}

const Bottom = () => {
  const context = useContext(SampleContext)

  return (
    // ボタンを押した時に context.themeColor を 'dark' に更新する
    <button onClick={() => context.setThemeColor('dark')}>テーマカラー更新</button>
  )
}
```

## 2. Recoil
## 3. SWR

参考: https://weseek.co.jp/tech/2565
