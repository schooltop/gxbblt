class Tag < ApplicationRecord
  enum tag_category: {
    general: 0,    #普通标签
    man_add: 1,    #人同步
    thing_add: 2,  #事同步
    merge_tag: 10  #合并标签
  }
end