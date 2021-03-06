USE [s16guest34]
GO
/****** Object:  StoredProcedure [dbo].[get_requests]    Script Date: 5/5/2016 1:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Plotkin
-- Create date: 2016-05-04
-- Description:	Product Request (Downloads) Form
-- =============================================
CREATE PROCEDURE [dbo].[get_requests] 

-- no parameters, this runs for all downloads (unsure as to
-- what specifications were requesting here)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Execute our query (again, no params needed, this is a global / "all time" report)
	BEGIN TRY
		SELECT p1.product_name AS 'Product', v1.version_num AS 'Version', DATENAME(MONTH, download_datetime) 
			AS 'Month', COUNT(download_datetime) AS 'Count'

		FROM [dbo].[Download] d1, [dbo].[Release] r1, [dbo].[Version] v1, [dbo].[Commit] c1, 
			[dbo].[Product] p1

		WHERE d1.release_id = r1.release_id AND
			r1.version_id = v1.version_id AND
			v1.commit_id = c1.commit_id AND
			c1.product_id = p1.product_id

		GROUP BY p1.product_id, v1.version_num, DATENAME(MONTH, download_datetime), p1.product_name
	END TRY

	-- If we catch an error on above query, throw detailed error message
	BEGIN CATCH
		DECLARE @err_num INT = ERROR_NUMBER();
		DECLARE @err_msg NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @err_sev INT = ERROR_SEVERITY();
		DECLARE @err_state INT = ERROR_STATE();
		PRINT 'Error number: ' + CAST(@err_num AS VARCHAR(10));
		RAISERROR(@err_msg, @err_sev, @err_state);
	END CATCH
END

GO
