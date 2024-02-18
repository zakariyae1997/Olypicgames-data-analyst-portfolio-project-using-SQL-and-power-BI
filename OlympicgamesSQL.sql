SELECT 
       [ID]
      ,[Name] AS Compititer_Name
      ,Case
	    when [Sex]='M' then 'Male' else 'Female' end as Sex

      ,[Age]
	  ,Case 
	    when Age < 18 THEN 'Under 18'
		when Age between 18 and 25 THEN '18-25'
		when Age between 25 and 30 THEN '25-30'
		when Age > 30 THEN 'Over 30'
		end as Age_Grouping

      ,[Height]
      ,[Weight]
      ,[NOC] as Nation_Code
	  --,CHARINDEX(' ',Games)-1 as exp1 pour séparer l'année
	    --,CHARINDEX(' ',REVERSE( Games))- 1 as exp2
		--,RIGHT(Games,CHARINDEX(' ',Reverse(Games))-1) as exp3
	  ,LEFT(Games,CHARINDEX(' ',Games)-1) as year
      --,[Games]
      --,[City]
      ,[Sport]
      ,[Event]

      ,Case
	   when [Medal]='NA' then 'Not registered' else Medal
	   end as Medal

  FROM [olympic_games].[dbo].[athletes_event_results]
  where Right (Games,CHARINDEX(' ',REVERSE( Games))-1) = 'summer'
