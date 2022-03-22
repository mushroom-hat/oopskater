.class Lcom/tpcstld/twozerogame/InputListener;
.super Ljava/lang/Object;
.source "InputListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# static fields
.field private static final MOVE_THRESHOLD:I = 0xfa

.field private static final RESET_STARTING:I = 0xa

.field private static final SWIPE_MIN_DISTANCE:I = 0x0

.field private static final SWIPE_THRESHOLD_VELOCITY:I = 0x19


# instance fields
.field private beganOnIcon:Z

.field private hasMoved:Z

.field private lastDx:F

.field private lastDy:F

.field private final mView:Lcom/tpcstld/twozerogame/MainView;

.field private previousDirection:I

.field private previousX:F

.field private previousY:F

.field private startingX:F

.field private startingY:F

.field private veryLastDirection:I

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(Lcom/tpcstld/twozerogame/MainView;)V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 25
    iput v0, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 26
    iput v0, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->hasMoved:Z

    .line 31
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->beganOnIcon:Z

    .line 35
    iput-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    return-void
.end method

.method static synthetic access$000(Lcom/tpcstld/twozerogame/InputListener;)Lcom/tpcstld/twozerogame/MainView;
    .locals 0

    .line 10
    iget-object p0, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    return-object p0
.end method

.method private iconPressed(II)Z
    .locals 4

    const/4 v0, 0x1

    .line 156
    invoke-direct {p0, v0}, Lcom/tpcstld/twozerogame/InputListener;->isTap(I)Z

    move-result v1

    if-eqz v1, :cond_0

    int-to-float v1, p1

    iget v2, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget-object v3, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget v3, v3, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int/2addr p1, v3

    int-to-float p1, p1

    invoke-direct {p0, v1, v2, p1}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1

    if-eqz p1, :cond_0

    int-to-float p1, p2

    iget v1, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget-object v2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget v2, v2, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int/2addr p2, v2

    int-to-float p2, p2

    .line 157
    invoke-direct {p0, p1, v1, p2}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private inRange(FFF)Z
    .locals 0

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_0

    cmpg-float p1, p2, p3

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isTap(I)Z
    .locals 3

    .line 165
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/InputListener;->pathMoved()F

    move-result v0

    iget-object v1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget v1, v1, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    iget-object v2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget v2, v2, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    mul-int v1, v1, v2

    mul-int v1, v1, p1

    int-to-float p1, v1

    cmpg-float p1, v0, p1

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private pathMoved()F
    .locals 4

    .line 152
    iget v0, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget v1, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    sub-float v2, v0, v1

    sub-float/2addr v0, v1

    mul-float v2, v2, v0

    iget v0, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget v1, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    sub-float v3, v0, v1

    sub-float/2addr v0, v1

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    return v2
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10

    .line 39
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_17

    const/4 v3, 0x2

    if-eq p1, v2, :cond_12

    if-eq p1, v3, :cond_0

    goto/16 :goto_4

    .line 55
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    .line 56
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    .line 57
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->isActive()Z

    move-result p1

    if-eqz p1, :cond_11

    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/InputListener;->beganOnIcon:Z

    if-nez p1, :cond_11

    .line 58
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->previousX:F

    sub-float/2addr p1, p2

    .line 59
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDx:F

    add-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDx:F

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    add-float/2addr v4, v5

    const/high16 v5, 0x41200000    # 10.0f

    cmpg-float p2, p2, v4

    if-gez p2, :cond_1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p2, p2, v5

    if-lez p2, :cond_1

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    sub-float/2addr p2, v4

    .line 60
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p2, p2, v1

    if-lez p2, :cond_1

    .line 61
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    .line 62
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    .line 63
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDx:F

    .line 64
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 66
    :cond_1
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDx:F

    cmpl-float p2, p2, v1

    if-nez p2, :cond_2

    .line 67
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDx:F

    .line 69
    :cond_2
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->previousY:F

    sub-float/2addr p2, v4

    .line 70
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDy:F

    add-float/2addr v4, p2

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v6, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDy:F

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v7

    add-float/2addr v6, v7

    cmpg-float v4, v4, v6

    if-gez v4, :cond_3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget v5, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    sub-float/2addr v4, v5

    .line 71
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v4, v1

    if-lez v4, :cond_3

    .line 72
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iput v4, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    .line 73
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iput v4, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    .line 74
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDy:F

    .line 75
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    iput v4, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 77
    :cond_3
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDy:F

    cmpl-float v4, v4, v1

    if-nez v4, :cond_4

    .line 78
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDy:F

    .line 80
    :cond_4
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/InputListener;->pathMoved()F

    move-result v4

    cmpl-float v1, v4, v1

    if-lez v1, :cond_11

    iget-boolean v1, p0, Lcom/tpcstld/twozerogame/InputListener;->hasMoved:Z

    if-nez v1, :cond_11

    const/high16 v1, -0x3c860000    # -250.0f

    const/high16 v4, -0x3e380000    # -25.0f

    const/high16 v5, 0x437a0000    # 250.0f

    const/high16 v6, 0x41c80000    # 25.0f

    const/4 v7, 0x3

    cmpl-float v8, p2, v6

    if-ltz v8, :cond_5

    .line 83
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v9

    cmpl-float v8, v8, v9

    if-gez v8, :cond_6

    :cond_5
    iget v8, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget v9, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    sub-float/2addr v8, v9

    cmpl-float v8, v8, v5

    if-ltz v8, :cond_7

    :cond_6
    iget v8, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    rem-int/lit8 v9, v8, 0x2

    if-eqz v9, :cond_7

    mul-int/lit8 v8, v8, 0x2

    .line 85
    iput v8, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 86
    iput v3, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    .line 87
    iget-object v0, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0, v3}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    :goto_0
    const/4 v0, 0x1

    goto :goto_1

    :cond_7
    cmpg-float v3, p2, v4

    if-gtz v3, :cond_8

    .line 88
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpl-float v3, v3, v8

    if-gez v3, :cond_9

    :cond_8
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget v8, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    sub-float/2addr v3, v8

    cmpg-float v3, v3, v1

    if-gtz v3, :cond_a

    :cond_9
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    rem-int/lit8 v8, v3, 0x3

    if-eqz v8, :cond_a

    mul-int/lit8 v3, v3, 0x3

    .line 90
    iput v3, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 91
    iput v7, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    .line 92
    iget-object v3, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object v3, v3, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v3, v0}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    goto :goto_0

    :cond_a
    :goto_1
    cmpl-float v3, p1, v6

    if-ltz v3, :cond_b

    .line 95
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v3, v3, v6

    if-gez v3, :cond_c

    :cond_b
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget v6, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    sub-float/2addr v3, v6

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_d

    :cond_c
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    rem-int/lit8 v5, v3, 0x5

    if-eqz v5, :cond_d

    const/4 p1, 0x5

    mul-int/lit8 v3, v3, 0x5

    .line 97
    iput v3, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 98
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    .line 99
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1, v2}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    :goto_2
    const/4 v0, 0x1

    goto :goto_3

    :cond_d
    cmpg-float v3, p1, v4

    if-gtz v3, :cond_e

    .line 100
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p1, p1, p2

    if-gez p1, :cond_f

    :cond_e
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    sub-float/2addr p1, p2

    cmpg-float p1, p1, v1

    if-gtz p1, :cond_10

    :cond_f
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    rem-int/lit8 p2, p1, 0x7

    if-eqz p2, :cond_10

    const/4 p2, 0x7

    mul-int/lit8 p1, p1, 0x7

    .line 102
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 103
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    .line 104
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1, v7}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    goto :goto_2

    :cond_10
    :goto_3
    if-eqz v0, :cond_11

    .line 107
    iput-boolean v2, p0, Lcom/tpcstld/twozerogame/InputListener;->hasMoved:Z

    .line 108
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    .line 109
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    .line 113
    :cond_11
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->previousX:F

    .line 114
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->previousY:F

    return v2

    .line 117
    :cond_12
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    .line 118
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    .line 119
    iput v2, p0, Lcom/tpcstld/twozerogame/InputListener;->previousDirection:I

    .line 120
    iput v2, p0, Lcom/tpcstld/twozerogame/InputListener;->veryLastDirection:I

    .line 122
    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/InputListener;->hasMoved:Z

    if-nez p1, :cond_16

    .line 123
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1

    if-eqz p1, :cond_14

    .line 124
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->gameLost()Z

    move-result p1

    if-nez p1, :cond_13

    .line 125
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/MainView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->reset:I

    new-instance v0, Lcom/tpcstld/twozerogame/InputListener$1;

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/InputListener$1;-><init>(Lcom/tpcstld/twozerogame/InputListener;)V

    .line 126
    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->continue_game:I

    const/4 v0, 0x0

    .line 132
    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->reset_dialog_title:I

    .line 133
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->reset_dialog_message:I

    .line 134
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 135
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_4

    .line 137
    :cond_13
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->newGame()V

    goto :goto_4

    .line 140
    :cond_14
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->sXUndo:I

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1

    if-eqz p1, :cond_15

    .line 141
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->revertUndoState()V

    goto :goto_4

    .line 142
    :cond_15
    invoke-direct {p0, v3}, Lcom/tpcstld/twozerogame/InputListener;->isTap(I)Z

    move-result p1

    if-eqz p1, :cond_16

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    int-to-float p1, p1

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iget-object v0, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget v0, v0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    int-to-float v0, v0

    invoke-direct {p0, p1, p2, v0}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1

    if-eqz p1, :cond_16

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    int-to-float p1, p1

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iget-object v0, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget v0, v0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    int-to-float v0, v0

    .line 143
    invoke-direct {p0, p1, p2, v0}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1

    if-eqz p1, :cond_16

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-boolean p1, p1, Lcom/tpcstld/twozerogame/MainView;->continueButtonEnabled:Z

    if-eqz p1, :cond_16

    .line 144
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->setEndlessMode()V

    :cond_16
    :goto_4
    return v2

    .line 42
    :cond_17
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    .line 43
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    .line 44
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->x:F

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->startingX:F

    .line 45
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->y:F

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->startingY:F

    .line 46
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->previousX:F

    .line 47
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->previousY:F

    .line 48
    iput v1, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDx:F

    .line 49
    iput v1, p0, Lcom/tpcstld/twozerogame/InputListener;->lastDy:F

    .line 50
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->hasMoved:Z

    .line 51
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1

    if-nez p1, :cond_18

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->sXUndo:I

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->mView:Lcom/tpcstld/twozerogame/MainView;

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1

    if-eqz p1, :cond_19

    :cond_18
    const/4 v0, 0x1

    :cond_19
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->beganOnIcon:Z

    return v2
.end method
