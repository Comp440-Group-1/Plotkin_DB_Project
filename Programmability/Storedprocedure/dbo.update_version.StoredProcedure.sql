USE [s16guest34]
GO
/****** Object:  StoredProcedure [dbo].[update_version]    Script Date: 5/5/2016 1:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Benjamin Plotkin
-- Create date: 2016-05-04
-- Description:	Update version number in Version table
-- =============================================
CREATE PROCEDURE [dbo].[update_version]
	-- Parameters include integer ID for specific Product,
	-- string for version number to update, and string for
	-- new version number to push
	@product_id INT,
	@version_num VARCHAR(20),
	@new_version_num VARCHAR(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- make sure our parameters actually find something
	IF EXISTS (
		SELECT *
		FROM [Version] t1
		INNER JOIN [Commit] t2 ON t1.commit_id = t2.commit_id
		WHERE t2.product_id = @product_id AND 
			version_num = @version_num
		)
		-- if found, try to update found set
		BEGIN TRY
			UPDATE [Version]
			SET version_num = @new_version_num
				FROM [Version] t1
				INNER JOIN [Commit] t2 ON t1.commit_id = t2.commit_id
				WHERE t2.product_id = @product_id AND 
					version_num = @version_num
			SELECT 'Updated ' + @version_num + ' to ' + @new_version_num AS 'Message'
		END TRY

		-- catch any errors
		BEGIN CATCH
			DECLARE @err_num INT = ERROR_NUMBER();
			DECLARE @err_msg NVARCHAR(4000) = ERROR_MESSAGE();
			DECLARE @err_sev INT = ERROR_SEVERITY();
			DECLARE @err_state INT = ERROR_STATE();
			PRINT 'Error number: ' + CAST(@err_num AS VARCHAR(10));
			RAISERROR(@err_msg, @err_sev, @err_state);
		END CATCH

	ELSE -- we didn't find anything, raise a general error alert
		BEGIN
			RAISERROR('Product Version not found; canceling update.', 11,1)
		END
END

GO
