require("lualibs.lua")

function getJsonFromFile(file)
  local fileHandle = io.open(file)
  local jsonString = fileHandle:read('*a')
  fileHandle.close()
  local jsonData = utilities.json.tolua(jsonString)
  return jsonData
end

function printEduItems(file)
  local json = getJsonFromFile(file)
  for key, value in pairs(json) do
    tex.print("\\resumeEduEntry")
    tex.print("{" .. value["school"] .. "}")
    tex.print("{" .. value["school_location"] .. "}")
    tex.print("{" .. value["degree"] .. "}")
    tex.print("{" .. value["time_period"] .. "}")
  end
end

function printExpItems(file)
  local json = getJsonFromFile(file)
  for key, value in pairs(json) do
    tex.print("\\resumeExpEntry")
    tex.print("{" .. value["company"] .. "}")
    tex.print("{" .. value["company_location"] .. "}")
    tex.print("{" .. value["role"] .. "}")
    tex.print("{" .. value["team"] .. "}")
    tex.print("{" .. value["time_duration"] .. "}")

    tex.print("\\resumeItemListStart")
    for k, v in pairs(value["details"]) do
      tex.print("\\resumeItem")
      tex.print("{" .. v["description"] .. "}")
    end
    tex.print("\\resumeItemListEnd")
  end
end

function printProjItems(file)
  local json = getJsonFromFile(file)
  for key, value in pairs(json) do
    tex.print("\\resumeProjEntry")
    tex.print("{abc}")
    
    tex.print("\\resumeItemListStart")
    for k, v in pairs(value["details"]) do
      tex.print("\\resumeItem")
      tex.print("{" .. v["description"] .. "}")
    end
    tex.print("\\resumeItemListEnd")

  end
end

function printHeading(file)
  local json = getJsonFromFile(file)
  for key, value in pairs(json) do
    tex.print("\\begin{tabular*}{\\textwidth}{l@{\\extracolsep{\\fill}}r}")

    tex.print("\\textbf{\\href")
    tex.print("{" .. value["blog"] .. "/}")
    tex.print("{\\huge " .. value["name"] .. "}}")
    tex.print(" & Email : \\href")
    tex.print("{mailto:" .. value["email"] .. "}")
    tex.print("{" .. value["email"] .. "}\\\\")

    tex.print("\\href")
    tex.print("{".. value["github"] .. "/}")
    tex.print("{Github: " .. value["github"] .. "}")
    tex.print(" & Mobile : " .. value["phone"] .. "\\\\")

    tex.print("\\end{tabular*}")
  end
end
