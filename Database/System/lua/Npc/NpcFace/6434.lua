function 博文_主对话(玩家, 对话守卫, 选项编号, 界面层数)
  if 玩家.对话页面 == 0 then
    return "老夫经过多年研究，终于领悟了“剑气淬毒”的奥秘！<br>[剑气淬毒]：战、法使怪物中绿毒，道士无视怪物防御！<#UI:OpenFilterShop1>战士技能书店<#UI/><#UI:OpenFilterShop2>法师技能书店<#UI/><#UI:OpenFilterShop3>道士技能书店<#UI/>"
  end

  if 玩家.对话页面 == 11 then
    if 玩家.角色数据.脚本数字[1000] == 1 then
      return "你已学习过“剑气淬毒”，无法重复学习！<#SO:2>知道了<#SO/>"
    end

    if 玩家.元宝数量 < 188800 then
      return "身上不足[1888]元宝，无法学习此技能！<#SO:2>知道了<#SO/>"
    else
      玩家.元宝数量 = 玩家.元宝数量 - 188800
      玩家.角色数据.脚本数字[1000] = 1
      玩家:发送顶部公告("玩家：<font color='#00ff00'><u>[".. 玩家.对象名字 .."]</u></font>在盟重大陆“博文”处成功学习了<font color='#FF69B4'><u>[剑气淬毒]</u></font>技能！",true,false)
      玩家:发送系统消息("玩家：<font color='#FF4500'><u>[".. 玩家.对象名字 .."]</u></font><font color='#00FFFF'><u>在盟重大陆“博文”处成功学习了</u></font><font color='#FF1493'><u>[剑气淬毒]</u></font><font color='#00FFFF'><u>技能！</u></font>")
      return "恭喜你，成功学习了“剑气淬毒”技能！<#SO:1>返回首页<#SO/>"
    end
  end

  if 玩家.对话页面 == 111 then
    玩家.对话页面 = 0
    return 博文_主对话(玩家)
  end
end
return 博文_主对话