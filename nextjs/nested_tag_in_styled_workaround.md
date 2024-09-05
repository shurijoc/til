Error: Component selectors can only be used in conjunction with @emotion/babel-plugin, the swc Emotion plugin, or another Emotion-aware compiler transform.
というエラーが発生する。

対策のために styled(Box)やstyled(Typography)などのスタイル内で直接タグをネストする代わりに、クラス名（例: .styled-label）を使ってスタイリングすることで、子セレクタを排除してる。

以下が、変更箇所のBefore/After

### Before（変更前）
```tsx
const BoxGroup = styled(Box)<{ theme: Theme }>(({ theme }) => {
  return {
    marginTop: theme.spacing(4.375),
    // @ts-ignore
    [StyledLabel]: {  // ネストされた子セレクタ
      paddingBottom: theme.spacing(1.25),
    },
  }
})

const BoxFlex = styled(Box)<{ theme: Theme }>(({ theme }) => {
  return {
    display: 'flex',
    flexWrap: 'wrap',
    maxWidth: 815,
    margin: `0 ${theme.spacing(-1)}`,
    // @ts-ignore
    [StyledLabel]: {  // ネストされた子セレクタ
      paddingBottom: 0,
      color: theme.tertiary.lightness1,
      fontSize: 10,
    },
  }
})
```

### After（変更後）
```tsx
const BoxGroup = styled(Box)<{ theme: Theme }>(({ theme }) => {
  return {
    marginTop: theme.spacing(4.375),
    '.styled-label': {  // クラス名を使って子要素をターゲット
      paddingBottom: theme.spacing(1.25),
    },
  }
})

const BoxFlex = styled(Box)<{ theme: Theme }>(({ theme }) => {
  return {
    display: 'flex',
    flexWrap: 'wrap',
    maxWidth: 815,
    margin: `0 ${theme.spacing(-1)}`,
    '.styled-label': {  // クラス名を使って子要素をターゲット
      paddingBottom: 0,
      color: theme.tertiary.lightness1,
      fontSize: 10,
    },
  }
})
```

### 変更点の概要
- **Before:** 子セレクタを`[StyledLabel]`のようにネストしてターゲットしていました。
- **After:** クラス名（例: `.styled-label`）を使用して、子要素をターゲットしています。
