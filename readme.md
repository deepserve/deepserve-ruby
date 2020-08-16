

### Set the API Key
```
# config/initializers/deepserve.rb
require 'deepserve'
Deepserve.api_key = ENV['DEEPSERVE_KEY']

```



### Inference
```
Deepserve.predict('jeffrwells/imdb-classifier', {

})


prediction = Deepserve.project('jeffrwells/imdb-classifier').predict({
  test: 'data'
})

prediction.output[0]


```
