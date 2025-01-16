-- NotifyLibrary.lua
local NotifyLibrary = {}

function NotifyLibrary.new()
    -- Tạo GUI chính
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local NotificationText = Instance.new("TextLabel")
    local BlurEffect = Instance.new("ImageLabel")

    -- Thuộc tính của ScreenGui
    ScreenGui.Name = "FluentNotifyUI"
    ScreenGui.Parent = game.CoreGui -- Thêm vào CoreGui để luôn hiển thị
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Thuộc tính của Frame
    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1) -- Màu nền xám đậm
    Frame.BackgroundTransparency = 0.3 -- Độ trong suốt nhẹ
    Frame.BorderSizePixel = 0 -- Không có viền
    Frame.Position = UDim2.new(1, -320, 1, 20) -- Vị trí: Góc dưới bên phải (ẩn trước)
    Frame.Size = UDim2.new(0, 300, 0, 80) -- Kích thước: 300x80
    Frame.AnchorPoint = Vector2.new(1, 1) -- Căn góc dưới bên phải
    Frame.ClipsDescendants = true -- Ẩn nội dung ngoài khung
    Frame.Visible = false -- Ban đầu ẩn

    -- Bo góc Fluent
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 15) -- Bo góc 15px
    UICorner.Parent = Frame

    -- Hiệu ứng Blur phía sau
    BlurEffect.Name = "BlurEffect"
    BlurEffect.Parent = Frame
    BlurEffect.BackgroundTransparency = 1
    BlurEffect.Size = UDim2.new(1, 0, 1, 0)
    BlurEffect.Image = "rbxassetid://7133302826" -- Asset blur (có thể thay bằng ảnh của bạn)
    BlurEffect.ScaleType = Enum.ScaleType.Slice
    BlurEffect.SliceCenter = Rect.new(10, 10, 118, 118)
    BlurEffect.ImageTransparency = 0.7 -- Độ trong suốt của hiệu ứng mờ

    -- Thuộc tính của TitleLabel (tiêu đề thông báo)
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = Frame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -20, 0, 30) -- Kích thước: chỉ tiêu đề
    TitleLabel.Position = UDim2.new(0, 10, 0, 5) -- Vị trí cách trên 5px
    TitleLabel.Font = Enum.Font.GothamBold -- Font hiện đại
    TitleLabel.Text = "Notification Title" -- Tiêu đề mặc định
    TitleLabel.TextColor3 = Color3.new(1, 1, 1) -- Màu chữ trắng
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left -- Căn trái

    -- Thuộc tính của NotificationText (nội dung thông báo)
    NotificationText.Name = "NotificationText"
    NotificationText.Parent = Frame
    NotificationText.BackgroundTransparency = 1
    NotificationText.Size = UDim2.new(1, -20, 0, 40) -- Kích thước: phần nội dung
    NotificationText.Position = UDim2.new(0, 10, 0, 35) -- Vị trí ngay dưới tiêu đề
    NotificationText.Font = Enum.Font.Gotham -- Font hiện đại
    NotificationText.Text = "This is the notification content!" -- Nội dung mặc định
    NotificationText.TextColor3 = Color3.new(1, 1, 1) -- Màu chữ trắng
    NotificationText.TextSize = 14
    NotificationText.TextXAlignment = Enum.TextXAlignment.Left -- Căn trái
    NotificationText.TextWrapped = true -- Tự xuống dòng nếu quá dài

    -- Hàm hiển thị Notify với hiệu ứng Tween
    function NotifyLibrary:ShowNotification(title, text, duration)
        -- Cập nhật nội dung và tiêu đề
        TitleLabel.Text = title
        NotificationText.Text = text

        -- Hiển thị Notify
        Frame.Visible = true
        Frame:TweenPosition(UDim2.new(1, -320, 1, -100), "Out", "Quad", 0.5, true) -- Trượt vào trong 0.5s

        -- Ẩn Notify sau thời gian duration
        task.wait(duration)
        Frame:TweenPosition(UDim2.new(1, -320, 1, 20), "In", "Quad", 0.5, true) -- Trượt xuống dưới
        task.wait(0.5)
        Frame.Visible = false
    end

    return NotifyLibrary
end

return NotifyLibrary
