require(RSelenium)
require(dplyr)



####################################### Environmental Information Preparation
web_link <- "http://yqzx.ustc.edu.cn/login_cas"
login_name <- "SA16019027"
login_password <- "********"
interval <- 0.5 # fillment interval
money_bound <- 10000 # 4500 * 7 = 31500




######################################## Prior Information Preparation
equip_list <- c("367","324","323","382","379","327","325","687")

equip_price_list <- c(50, 50, 40, 20, 20, 20, 30, 20)

note_list <-  rbind(
              c("利用微孔板式发光检测仪探究发光功能化磁性微球的化学发光性质",
                "利用微孔板式发光检测仪探究不同来源发光功能化磁性微球之间化学发光性能差异",
                "利用微孔板式发光检测仪探究不同方法合成的功能化磁性微球之间化学发光性能差异",
                "利用微孔板式发光检测仪探究化学发光功能化磁性微球日间日内化学发光性能的稳定性"),
              
              c("发光功能化材料的荧光性质研究以及其表面物质定性研究",
                "荧光物质对发光功能化材料的发光光谱影响研究，以及发光光谱的检测",
                "荧光小分子与发光功能化材料体系化学发光相互影响的研究",
                "化学发光材料与荧光分子的能量共振转移的性质研究"),
              
              c("利用紫外分光光度计获取石墨烯纳米材料的紫外吸收光谱",
                "利用紫外分光光度计探究发光纳米材料的最大吸收光谱",
                "利用紫外分光光度计表征化学发光功能化碳纳米材料的紫外吸收光谱",
                "利用紫外分光光度计探究化学发光功能化金属纳米材料的最大吸收光谱"),
              
              c("双功能化磁性核-壳介孔碳材料的电化学性质研究",
                "异鲁米诺和钴铁氧体功能化的氧化石墨烯电化学性质研究",
                "基于鲁米诺功能化碳量子点复合物的多色电位分辨电化学性质研究",
                "化学发光试剂/金属离子双功能化金纳米材料的电化学性质研究"),
              
              c("探究检测物化学发光动力学曲线的特征，获得最佳化学发光",
                "探究检测物化学发光的时长，研究化学发光动力学曲线",
                "通过控制变量法，对材料进行优化，得到最强的化学发光",
                "化学发光动力学曲线的比较，研究对比不同的化学发光物质对材料的影响"),
              
              c("利用台式高速冷冻离心机分离联吡啶钌功能化氧化石墨烯悬浮液",
                "利用台式高速冷冻离心机分离鲁米诺功能化金纳米悬浮液",
                "利用台式高速冷冻离心机分离鲁米诺功能化碳纳米管悬浮液", 
                "利用台式高速冷冻离心机分离ABEI功能化金纳米悬浮液"),
              
              c("利用台式离心机对碳纳米管悬浮液进行离心分离",
                "利用台式离心机对二氧化硅微球悬浮液进行离心分离",
                "利用台式离心机对银纳米材料悬浮液进行离心分离",
                "利用台式离心机对金纳米材料悬浮液进行离心分离"),
              
              c("利用差分脉冲安培法对合成样品的电化学性质进行分析",
                "对合成样品进行差分脉冲伏安测量，分析其电化学性质",
                "通过循环伏安测试来获得电化学性质以及反应原理",
                "利用线性扫描伏安法分析所发生电化学反应的原理")
                 )

sample_list <- rbind(
              c("化学发光双功能化磁性微球",
                 "不同来源化学发光双功能化磁性微球",
                 "不同方法合成的功能化磁性微球",
                 "不同批次化学发光功能化磁性微球"),
              c("鲁米诺发光功能化磁珠",
                "鲁米诺功能化石墨烯材料",
                "过氧化草酸脂水凝胶",
                "光泽精功能化石墨烯"),
              c("石墨烯",
                "鲁米诺",
                "碳纳米管",
                "吖啶酯"),
              c("N-（4-氨基丁基）-N-乙基异鲁米诺",
                "异鲁米诺",
                "鲁米诺",
                "联吡啶钌"),
              c("异鲁米诺和钴离子和荧光黄水凝胶",
                "碳酸钙微球内包裹钴离子和异鲁米诺",
                "石墨烯金纳米粒子异鲁米诺",
                "鲁米诺、光泽精、异鲁米诺水凝胶"),
              c("联吡啶钌功能化石墨烯悬浮液",
                "鲁米诺功能化金纳米悬浮液",
                "鲁米诺功能化碳纳米管悬浮液",
                "ABEI功能化金纳米悬浮液"),
              c("碳纳米管",
                "二氧化硅微球",
                "银纳米团簇",
                "金纳米团簇"),
              c("异鲁米诺功能化爆米花状纳米金材料",
                "水溶性二氧化钛",
                "掺氮碳量子点",
                "硫化镉量子点")
              )

sample_number <- as.character(5: 20)
test_time <- seq(3, 6, 0.5)

user_name <- c("李琪","韩智莉","刘雅婷","杨芮","杜德鑫","巨力",
               "吕爱华","高冰洁", "郭明全", "吴雨阳", "王依莎")

user_id <- c("BA15019002","BA15019001","BA16019013","BA17019002","BA18019002","SA16019027",
             "SA17019031","SA17019011","BA18019003", "SA18019058", "SA18019055")

user_email <- c("leakey@mail.ustc.edu.cn","han303@mail.ustc.edu.cn","ytliu@mail.ustc.edu.cn",
                "yr1992@mail.ustc.edu.cn","dxdu@mail.ustc.edu.cn","sariel@mail.ustc.edu.cn",
                "lvah031@mail.ustc.edu.cn","gaobj@mail.ustc.edu.cn", "gminquan@mail.ustc.edu.cn",
                "wuyuy@mail.ustc.edu.cn", "wys000@mail.ustc.edu.cn")

today_date <- Sys.Date()




####################################### Linkage Establishment 
rD <- rsDriver(check = F)
remDr <- rD[["client"]]
remDr$setImplicitWaitTimeout(milliseconds = 10000)
remDr$navigate(web_link)

remDr$findElement(using = "id", value = "login")$sendKeysToElement(list(login_name))
Sys.sleep(interval)

remDr$findElement(using = "id", value = "password")$sendKeysToElement(list(login_password))
Sys.sleep(interval)

remDr$findElement(using = "id", value = "button")$clickElement()
Sys.sleep(interval)

remDr$findElement(using = "id", value = "my-testing-item")$clickElement()
Sys.sleep(interval)

##################################### Filling Loop Start 

i <- 0

  while(i < 4){
    cur_date <- as.character(today_date - i)
    equip_cost <- rep(0, length(equip_list))
    equip_time <- rep(0, length(equip_list))
    while (sum(equip_cost) < money_bound/4) {
      cat("Day: ", cur_date, "\n")
      cur_instru_id <- sample(1: length(equip_list), 1)
      cur_sample_id <- sample(1: dim(sample_list)[2], 1)
      cur_note_id <- sample(1: dim(note_list)[2], 1)
      cur_duration <- sample(seq(3, 6, 0.5), 1)
      cur_operator_id <- sample(1: length(user_id), 1)
      cur_tester_id <- sample(1: length(user_id), 1)
      
      while((cur_duration + equip_time[cur_instru_id] > 24) & cur_operator_id == cur_tester_id ){
        cur_instru_id <- sample(1: length(equip_list), 1)
        cur_sample_id <- sample(1: dim(note_list)[2], 1)
        cur_duration <- sample(seq(3, 6, 0.5), 1)
        cur_operator_id <- sample(1: length(user_id), 1)
        cur_tester_id <- sample(1: length(user_id), 1)
      }
      
      
      equip_time[cur_instru_id] <- cur_duration + equip_time[cur_instru_id]
      equip_cost[cur_instru_id] <- cur_duration * equip_price_list[cur_instru_id] + 
                                   equip_cost[cur_instru_id]
      
      cat("Equipment_Time:\n", equip_time, "\n")
      cat("Equipment_Cost:\n", equip_cost, "\n")
      
      remDr$findElement(using = "id", value = "toolbar")
      temp$clickElement()
      Sys.sleep(interval)
      
      remDr$findElement(using = "xpath", 
                        value = paste("//select[@name='instrument_id']/option[@value='", 
                                      equip_list[cur_instru_id], "']", sep = ""))$clickElement()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "test_date")
      temp$clearElement()
      temp$sendKeysToElement(list(cur_date))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "duration")
      temp$sendKeysToElement(list(as.character(cur_duration)))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "note")
      temp$sendKeysToElement(list(note_list[cur_note_id]))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "sample_name")
      temp$sendKeysToElement(list(sample_list[cur_sample_id]))
      temp$click()
      Sys.sleep(interval)
      
      
      temp <- remDr$findElement(using = "name", value = "sample_count")
      temp$sendKeysToElement(list(as.character(sample(5: 20, 1))))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "tester_number")
      temp$clearElement()
      temp$sendKeysToElement(list(user_id[cur_tester_id]))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "tester_name")
      temp$clearElement()
      temp$sendKeysToElement(list(user_name[cur_tester_id]))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "tester_group")
      temp$clearElement()
      temp$sendKeysToElement(list("化学与材料科学学院"))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "tester_email")
      temp$clearElement()
      temp$sendKeysToElement(list(user_email[cur_tester_id]))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "tester_phone")
      temp$clearElement()
      temp$sendKeysToElement(list("055163606857"))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "operator_number")
      temp$clearElement()
      temp$sendKeysToElement(list(user_id[cur_operator_id]))
      temp$click()
      Sys.sleep(interval)
      
      temp <- remDr$findElement(using = "name", value = "operator_name")
      temp$clearElement()
      temp$sendKeysToElement(list(user_name[cur_operator_id]))
      temp$click()
      Sys.sleep(interval)
      
      remDr$findElement(using = "xpath", value = "//form/div[last()]/div/button[@type='submit']")$clickElement()
      Sys.sleep(2)
      }
    i <- i + 1
  }

########################################### Filling End
remDr$close()
rD[["server"]]$stop()

