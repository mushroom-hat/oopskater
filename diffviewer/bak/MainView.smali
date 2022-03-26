.class public Lcom/tpcstld/twozerogame/MainView;
.super Landroid/view/View;
.source "MainView.java"


# static fields
.field static final BASE_ANIMATION_TIME:I = 0x5f5e100

.field private static final INITIAL_VELOCITY:F = 0.375f

.field private static final MERGING_ACCELERATION:F = -0.5f

.field private static final TAG:Ljava/lang/String; = "MainView"


# instance fields
.field private background:Landroid/graphics/Bitmap;

.field private backgroundRectangle:Landroid/graphics/drawable/Drawable;

.field private final bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

.field private bodyStartYAll:I

.field private bodyTextSize:F

.field private cellSize:I

.field private cellTextSize:F

.field public continueButtonEnabled:Z

.field private eYAll:I

.field public endingX:I

.field public endingY:I

.field private fadeRectangle:Landroid/graphics/drawable/Drawable;

.field public final game:Lcom/tpcstld/twozerogame/MainGame;

.field private gameOverTextSize:F

.field private gridWidth:I

.field public hasSaveState:Z

.field private headerTextSize:F

.field private iconPaddingSize:I

.field public iconSize:I

.field private instructionsTextSize:F

.field private lastFPSTime:J

.field private lightUpRectangle:Landroid/graphics/drawable/Drawable;

.field private loseGameOverlay:Landroid/graphics/drawable/BitmapDrawable;

.field public final numCellTypes:I

.field private final paint:Landroid/graphics/Paint;

.field refreshLastTime:Z

.field public sXNewGame:I

.field public sXUndo:I

.field private sYAll:I

.field public sYIcons:I

.field showHelp:Z

.field public startingX:I

.field public startingY:I

.field private textPaddingSize:I

.field private textSize:F

.field private titleStartYAll:I

.field private titleTextSize:F

.field private titleWidthHighScore:I

.field private titleWidthScore:I

.field private winGameContinueOverlay:Landroid/graphics/drawable/BitmapDrawable;

.field private winGameFinalOverlay:Landroid/graphics/drawable/BitmapDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 78
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x15

    .line 27
    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->numCellTypes:I

    .line 28
    new-array v0, v0, [Landroid/graphics/drawable/BitmapDrawable;

    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    .line 31
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainView;->hasSaveState:Z

    .line 33
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainView;->continueButtonEnabled:Z

    const/4 v1, 0x1

    .line 44
    iput-boolean v1, p0, Lcom/tpcstld/twozerogame/MainView;->refreshLastTime:Z

    .line 47
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/tpcstld/twozerogame/MainView;->lastFPSTime:J

    .line 55
    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    const/4 v2, 0x0

    .line 56
    iput v2, p0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    .line 57
    iput v2, p0, Lcom/tpcstld/twozerogame/MainView;->cellTextSize:F

    .line 58
    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->background:Landroid/graphics/Bitmap;

    .line 80
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 82
    new-instance v2, Lcom/tpcstld/twozerogame/MainGame;

    invoke-direct {v2, p1, p0}, Lcom/tpcstld/twozerogame/MainGame;-><init>(Landroid/content/Context;Lcom/tpcstld/twozerogame/MainView;)V

    iput-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    .line 85
    :try_start_0
    sget p1, Lcom/tpcstld/twozerogame/base/R$drawable;->background_rectangle:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    .line 86
    sget p1, Lcom/tpcstld/twozerogame/base/R$drawable;->light_up_rectangle:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->lightUpRectangle:Landroid/graphics/drawable/Drawable;

    .line 87
    sget p1, Lcom/tpcstld/twozerogame/base/R$drawable;->fade_rectangle:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->fadeRectangle:Landroid/graphics/drawable/Drawable;

    .line 88
    sget p1, Lcom/tpcstld/twozerogame/base/R$color;->background:I

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->setBackgroundColor(I)V

    .line 89
    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string v0, "ClearSans-Bold.ttf"

    invoke-static {p1, v0}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p1

    .line 90
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 91
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 93
    sget-object v0, Lcom/tpcstld/twozerogame/MainView;->TAG:Ljava/lang/String;

    const-string v1, "Error getting assets?"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 95
    :goto_0
    new-instance p1, Lcom/tpcstld/twozerogame/InputListener;

    invoke-direct {p1, p0}, Lcom/tpcstld/twozerogame/InputListener;-><init>(Lcom/tpcstld/twozerogame/MainView;)V

    invoke-virtual {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 96
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->newGame()V

    return-void
.end method

.method private centerText()I
    .locals 2

    .line 568
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->descent()F

    move-result v0

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    move-result v1

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private createBackgroundBitmap(II)V
    .locals 1

    .line 428
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->background:Landroid/graphics/Bitmap;

    .line 429
    new-instance p1, Landroid/graphics/Canvas;

    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->background:Landroid/graphics/Bitmap;

    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 430
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawHeader(Landroid/graphics/Canvas;)V

    const/4 p2, 0x0

    .line 431
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/MainView;->drawNewGameButton(Landroid/graphics/Canvas;Z)V

    .line 432
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawUndoButton(Landroid/graphics/Canvas;)V

    .line 433
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawBackground(Landroid/graphics/Canvas;)V

    .line 434
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawBackgroundGrid(Landroid/graphics/Canvas;)V

    .line 435
    iget-boolean p2, p0, Lcom/tpcstld/twozerogame/MainView;->showHelp:Z

    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawInstructions(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method private createBitmapCells()V
    .locals 13

    .line 440
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 441
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->getCellRectangleIds()[I

    move-result-object v1

    .line 442
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/4 v2, 0x1

    .line 443
    :goto_0
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    array-length v3, v3

    if-ge v2, v3, :cond_0

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    int-to-double v5, v2

    .line 444
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-int v3, v3

    .line 445
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->cellTextSize:F

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 446
    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->cellTextSize:F

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    int-to-float v6, v5

    mul-float v4, v4, v6

    const v6, 0x3f666666    # 0.9f

    mul-float v4, v4, v6

    int-to-float v5, v5

    mul-float v5, v5, v6

    iget-object v6, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    div-float/2addr v4, v5

    .line 447
    iget-object v5, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 448
    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 449
    new-instance v12, Landroid/graphics/Canvas;

    invoke-direct {v12, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 450
    aget v5, v1, v2

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget v11, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    move-object v5, p0

    move-object v6, v12

    move v10, v11

    invoke-direct/range {v5 .. v11}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    .line 451
    invoke-direct {p0, v12, v3}, Lcom/tpcstld/twozerogame/MainView;->drawCellText(Landroid/graphics/Canvas;I)V

    .line 452
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v5, v0, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    aput-object v5, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private createEndGameStates(Landroid/graphics/Canvas;ZZ)V
    .locals 10

    .line 397
    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    sub-int v7, v0, v1

    .line 398
    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    sub-int v8, v0, v1

    .line 399
    div-int/lit8 v0, v7, 0x2

    .line 400
    div-int/lit8 v1, v8, 0x2

    const/16 v2, 0x7f

    const/16 v9, 0xff

    if-eqz p2, :cond_1

    .line 402
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->lightUpRectangle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 403
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainView;->lightUpRectangle:Landroid/graphics/drawable/Drawable;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v8}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    .line 404
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->lightUpRectangle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 405
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/tpcstld/twozerogame/base/R$color;->text_white:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 406
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p2, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 407
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->gameOverTextSize:F

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 408
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 409
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result p2

    sub-int/2addr v1, p2

    .line 410
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v2, Lcom/tpcstld/twozerogame/base/R$string;->you_win:I

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    int-to-float v0, v0

    int-to-float v2, v1

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 411
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    if-eqz p3, :cond_0

    .line 412
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/tpcstld/twozerogame/base/R$string;->go_on:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 413
    :cond_0
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/tpcstld/twozerogame/base/R$string;->for_now:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 414
    :goto_0
    iget p3, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    mul-int/lit8 p3, p3, 0x2

    add-int/2addr v1, p3

    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result p3

    mul-int/lit8 p3, p3, 0x2

    sub-int/2addr v1, p3

    int-to-float p3, v1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 416
    :cond_1
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->fadeRectangle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 417
    iget-object v4, p0, Lcom/tpcstld/twozerogame/MainView;->fadeRectangle:Landroid/graphics/drawable/Drawable;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v8}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    .line 418
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->fadeRectangle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 419
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v2, Lcom/tpcstld/twozerogame/base/R$color;->text_black:I

    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 420
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p2, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 421
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget p3, p0, Lcom/tpcstld/twozerogame/MainView;->gameOverTextSize:F

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 422
    iget-object p2, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object p3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 423
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/tpcstld/twozerogame/base/R$string;->game_over:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    int-to-float p3, v0

    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result v0

    sub-int/2addr v1, v0

    int-to-float v0, v1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :goto_1
    return-void
.end method

.method private createOverlays()V
    .locals 5

    .line 477
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 479
    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    sub-int/2addr v2, v3

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 480
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v3, 0x1

    .line 481
    invoke-direct {p0, v2, v3, v3}, Lcom/tpcstld/twozerogame/MainView;->createEndGameStates(Landroid/graphics/Canvas;ZZ)V

    .line 482
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->winGameContinueOverlay:Landroid/graphics/drawable/BitmapDrawable;

    .line 483
    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    sub-int/2addr v2, v4

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 484
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v4, 0x0

    .line 485
    invoke-direct {p0, v2, v3, v4}, Lcom/tpcstld/twozerogame/MainView;->createEndGameStates(Landroid/graphics/Canvas;ZZ)V

    .line 486
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->winGameFinalOverlay:Landroid/graphics/drawable/BitmapDrawable;

    .line 487
    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    sub-int/2addr v2, v3

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 488
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 489
    invoke-direct {p0, v2, v4, v4}, Lcom/tpcstld/twozerogame/MainView;->createEndGameStates(Landroid/graphics/Canvas;ZZ)V

    .line 490
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->loseGameOverlay:Landroid/graphics/drawable/BitmapDrawable;

    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 7

    .line 267
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v6, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    return-void
.end method

.method private drawBackgroundGrid(Landroid/graphics/Canvas;)V
    .locals 12

    .line 272
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 273
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v9, 0x0

    .line 275
    :goto_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v10, 0x4

    if-ge v9, v10, :cond_1

    const/4 v11, 0x0

    .line 276
    :goto_1
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ge v11, v10, :cond_0

    .line 277
    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    add-int/2addr v2, v3

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    add-int v5, v4, v3

    mul-int v5, v5, v9

    add-int/2addr v5, v2

    add-int v7, v5, v4

    .line 279
    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    add-int/2addr v2, v3

    add-int/2addr v3, v4

    mul-int v3, v3, v11

    add-int v6, v2, v3

    add-int v8, v6, v4

    move-object v2, p0

    move-object v3, p1

    move-object v4, v0

    .line 282
    invoke-direct/range {v2 .. v8}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private drawCellText(Landroid/graphics/Canvas;I)V
    .locals 4

    .line 152
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result v0

    const/16 v1, 0x8

    if-lt p2, v1, :cond_0

    .line 154
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/tpcstld/twozerogame/base/R$color;->text_white:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/tpcstld/twozerogame/base/R$color;->text_black:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 158
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    div-int/lit8 v2, v1, 0x2

    int-to-float v2, v2

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v1, v0

    int-to-float v0, v1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v2, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawCells(Landroid/graphics/Canvas;)V
    .locals 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 288
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v3, v0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 289
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/4 v3, 0x0

    .line 291
    :goto_0
    iget-object v4, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    if-ge v3, v4, :cond_a

    const/4 v5, 0x0

    .line 292
    :goto_1
    iget-object v6, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ge v5, v4, :cond_9

    .line 293
    iget v6, v0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    iget v7, v0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    add-int/2addr v6, v7

    iget v8, v0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    add-int v9, v8, v7

    mul-int v9, v9, v3

    add-int/2addr v6, v9

    add-int v9, v6, v8

    .line 295
    iget v10, v0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    add-int/2addr v10, v7

    add-int/2addr v7, v8

    mul-int v7, v7, v5

    add-int/2addr v10, v7

    add-int/2addr v8, v10

    .line 298
    iget-object v7, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v7, v7, Lcom/tpcstld/twozerogame/MainGame;->grid:Lcom/tpcstld/twozerogame/Grid;

    invoke-virtual {v7, v3, v5}, Lcom/tpcstld/twozerogame/Grid;->getCellContent(II)Lcom/tpcstld/twozerogame/Tile;

    move-result-object v7

    if-eqz v7, :cond_7

    .line 301
    invoke-virtual {v7}, Lcom/tpcstld/twozerogame/Tile;->getValue()I

    move-result v11

    .line 302
    invoke-static {v11}, Lcom/tpcstld/twozerogame/MainView;->log2(I)I

    move-result v11

    .line 305
    iget-object v12, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v12, v12, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v12, v3, v5}, Lcom/tpcstld/twozerogame/AnimationGrid;->getAnimationCell(II)Ljava/util/ArrayList;

    move-result-object v12

    .line 307
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x1

    sub-int/2addr v13, v14

    const/4 v15, 0x0

    :goto_2
    if-ltz v13, :cond_6

    .line 308
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v4, v16

    check-cast v4, Lcom/tpcstld/twozerogame/AnimationCell;

    .line 310
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getAnimationType()I

    move-result v2

    const/4 v14, -0x1

    if-ne v2, v14, :cond_0

    const/4 v15, 0x1

    .line 313
    :cond_0
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->isActive()Z

    move-result v2

    if-nez v2, :cond_1

    move/from16 v19, v3

    move/from16 v20, v5

    move-object/from16 v23, v7

    move/from16 v24, v11

    move-object/from16 v25, v12

    const/16 v16, 0x0

    const/16 v17, 0x1

    goto/16 :goto_6

    .line 317
    :cond_1
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getAnimationType()I

    move-result v2

    const/4 v15, 0x2

    if-ne v2, v14, :cond_3

    move v14, v3

    .line 318
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getPercentageDone()D

    move-result-wide v2

    double-to-float v2, v2

    .line 320
    iget-object v3, v0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v4, v0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    mul-float v4, v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 322
    iget v3, v0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    div-int/2addr v3, v15

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v15, v4, v2

    mul-float v3, v3, v15

    .line 323
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v11

    int-to-float v4, v6

    add-float/2addr v4, v3

    float-to-int v4, v4

    int-to-float v15, v10

    add-float/2addr v15, v3

    float-to-int v15, v15

    move/from16 v19, v14

    int-to-float v14, v9

    sub-float/2addr v14, v3

    float-to-int v14, v14

    move/from16 v20, v5

    int-to-float v5, v8

    sub-float/2addr v5, v3

    float-to-int v3, v5

    invoke-virtual {v2, v4, v15, v14, v3}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 324
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v11

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2
    :goto_3
    move-object/from16 v23, v7

    move/from16 v24, v11

    move-object/from16 v25, v12

    const/16 v16, 0x0

    const/16 v17, 0x1

    goto/16 :goto_5

    :cond_3
    move/from16 v19, v3

    move/from16 v20, v5

    .line 325
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getAnimationType()I

    move-result v2

    const-wide/high16 v21, 0x3ff0000000000000L    # 1.0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 326
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getPercentageDone()D

    move-result-wide v2

    const-wide/high16 v4, 0x3fd8000000000000L    # 0.375

    mul-double v4, v4, v2

    add-double v4, v4, v21

    const-wide/high16 v21, -0x4020000000000000L    # -0.5

    mul-double v21, v21, v2

    mul-double v21, v21, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double v21, v21, v2

    add-double v4, v4, v21

    double-to-float v2, v4

    .line 329
    iget-object v3, v0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v4, v0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    mul-float v4, v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 331
    iget v3, v0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    div-int/2addr v3, v15

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v15, v4, v2

    mul-float v3, v3, v15

    .line 332
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v11

    int-to-float v4, v6

    add-float/2addr v4, v3

    float-to-int v4, v4

    int-to-float v5, v10

    add-float/2addr v5, v3

    float-to-int v5, v5

    int-to-float v14, v9

    sub-float/2addr v14, v3

    float-to-int v14, v14

    int-to-float v15, v8

    sub-float/2addr v15, v3

    float-to-int v3, v15

    invoke-virtual {v2, v4, v5, v14, v3}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 333
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v11

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_3

    .line 334
    :cond_4
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getAnimationType()I

    move-result v2

    if-nez v2, :cond_2

    .line 335
    invoke-virtual {v4}, Lcom/tpcstld/twozerogame/AnimationCell;->getPercentageDone()D

    move-result-wide v2

    .line 337
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v5, v15, :cond_5

    add-int/lit8 v5, v11, -0x1

    goto :goto_4

    :cond_5
    move v5, v11

    .line 340
    :goto_4
    iget-object v14, v4, Lcom/tpcstld/twozerogame/AnimationCell;->extras:[I

    const/16 v16, 0x0

    aget v14, v14, v16

    .line 341
    iget-object v4, v4, Lcom/tpcstld/twozerogame/AnimationCell;->extras:[I

    const/16 v17, 0x1

    aget v4, v4, v17

    .line 342
    invoke-virtual {v7}, Lcom/tpcstld/twozerogame/Tile;->getX()I

    move-result v15

    .line 343
    invoke-virtual {v7}, Lcom/tpcstld/twozerogame/Tile;->getY()I

    move-result v18

    sub-int/2addr v15, v14

    .line 344
    iget v14, v0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    move-object/from16 v23, v7

    iget v7, v0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    add-int v24, v14, v7

    mul-int v15, v15, v24

    move/from16 v24, v11

    move-object/from16 v25, v12

    int-to-double v11, v15

    sub-double v2, v2, v21

    invoke-static {v11, v12}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v11, v11, v2

    mul-double v11, v11, v21

    double-to-int v11, v11

    sub-int v18, v18, v4

    add-int/2addr v14, v7

    mul-int v4, v18, v14

    int-to-double v14, v4

    .line 345
    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v2

    mul-double v14, v14, v21

    double-to-int v2, v14

    .line 346
    iget-object v3, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v3, v3, v5

    add-int v4, v6, v11

    add-int v7, v10, v2

    add-int/2addr v11, v9

    add-int/2addr v2, v8

    invoke-virtual {v3, v4, v7, v11, v2}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 347
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v5

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    :goto_5
    const/4 v15, 0x1

    :goto_6
    add-int/lit8 v13, v13, -0x1

    move/from16 v3, v19

    move/from16 v5, v20

    move-object/from16 v7, v23

    move/from16 v11, v24

    move-object/from16 v12, v25

    const/4 v4, 0x4

    const/4 v14, 0x1

    goto/16 :goto_2

    :cond_6
    move/from16 v19, v3

    move/from16 v20, v5

    move/from16 v24, v11

    const/16 v16, 0x0

    if-nez v15, :cond_8

    .line 354
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v24

    invoke-virtual {v2, v6, v10, v9, v8}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    .line 355
    iget-object v2, v0, Lcom/tpcstld/twozerogame/MainView;->bitmapCell:[Landroid/graphics/drawable/BitmapDrawable;

    aget-object v2, v2, v24

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_7

    :cond_7
    move/from16 v19, v3

    move/from16 v20, v5

    const/16 v16, 0x0

    :cond_8
    :goto_7
    add-int/lit8 v5, v20, 0x1

    move/from16 v3, v19

    const/4 v4, 0x4

    goto/16 :goto_1

    :cond_9
    move/from16 v19, v3

    const/16 v16, 0x0

    add-int/lit8 v3, v19, 0x1

    goto/16 :goto_0

    :cond_a
    return-void
.end method

.method private drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V
    .locals 0

    .line 147
    invoke-virtual {p2, p3, p4, p5, p6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 148
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private drawEndGameState(Landroid/graphics/Canvas;)V
    .locals 7

    const/4 v0, 0x0

    .line 364
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainView;->continueButtonEnabled:Z

    .line 365
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/AnimationGrid;->globalAnimation:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/tpcstld/twozerogame/AnimationCell;

    .line 366
    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/AnimationCell;->getAnimationType()I

    move-result v4

    if-nez v4, :cond_0

    .line 367
    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/AnimationCell;->getPercentageDone()D

    move-result-wide v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 371
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/MainGame;->gameWon()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 372
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainGame;->canContinue()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    .line 373
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/MainView;->continueButtonEnabled:Z

    .line 374
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->winGameContinueOverlay:Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_1

    .line 376
    :cond_2
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->winGameFinalOverlay:Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_1

    .line 378
    :cond_3
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v3}, Lcom/tpcstld/twozerogame/MainGame;->gameLost()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 379
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->loseGameOverlay:Landroid/graphics/drawable/BitmapDrawable;

    :cond_4
    :goto_1
    if-eqz v0, :cond_5

    .line 383
    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v6, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/drawable/BitmapDrawable;->setBounds(IIII)V

    const-wide v3, 0x406fe00000000000L    # 255.0

    mul-double v1, v1, v3

    double-to-int v1, v1

    .line 384
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 385
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_5
    return-void
.end method

.method private drawEndlessText(Landroid/graphics/Canvas;)V
    .locals 4

    .line 390
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 391
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 392
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/tpcstld/twozerogame/base/R$color;->text_black:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 393
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/tpcstld/twozerogame/base/R$string;->endless:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawHeader(Landroid/graphics/Canvas;)V
    .locals 4

    .line 250
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->headerTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 251
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/tpcstld/twozerogame/base/R$color;->text_black:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 252
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 253
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    .line 254
    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->sYAll:I

    sub-int/2addr v1, v0

    .line 255
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/tpcstld/twozerogame/base/R$string;->header:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    int-to-float v2, v2

    int-to-float v1, v1

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawInstructions(Landroid/graphics/Canvas;)V
    .locals 4

    .line 259
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->instructionsTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 260
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 261
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    .line 262
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/tpcstld/twozerogame/base/R$string;->instructions:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    int-to-float v2, v2

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    sub-int/2addr v3, v0

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    add-int/2addr v3, v0

    int-to-float v0, v3

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawNewGameButton(Landroid/graphics/Canvas;Z)V
    .locals 8

    if-eqz p2, :cond_0

    .line 206
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->lightUpRectangle:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int v5, v3, v0

    add-int v6, v4, v0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    goto :goto_0

    .line 214
    :cond_0
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int v5, v3, v0

    add-int v6, v4, v0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    .line 223
    :goto_0
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->ic_action_refresh:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->iconPaddingSize:I

    add-int v3, v0, v1

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    add-int v5, v4, v1

    iget v6, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int/2addr v0, v6

    sub-int v7, v0, v1

    add-int/2addr v4, v6

    sub-int v6, v4, v1

    move-object v0, p0

    move-object v1, p1

    move v4, v5

    move v5, v7

    .line 222
    invoke-direct/range {v0 .. v6}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    return-void
.end method

.method private drawScoreText(Landroid/graphics/Canvas;)V
    .locals 9

    .line 163
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 164
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 166
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v3, v3, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    float-to-int v0, v0

    .line 167
    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v4, v2, Lcom/tpcstld/twozerogame/MainGame;->score:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    float-to-int v1, v1

    .line 169
    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->titleWidthHighScore:I

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    .line 170
    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->titleWidthScore:I

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    mul-int/lit8 v3, v2, 0x2

    add-int/2addr v1, v3

    .line 172
    div-int/lit8 v3, v0, 0x2

    .line 173
    div-int/lit8 v4, v1, 0x2

    .line 175
    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    sub-int v0, v5, v0

    sub-int v2, v0, v2

    sub-int v1, v2, v1

    .line 182
    iget-object v6, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    iget v7, p0, Lcom/tpcstld/twozerogame/MainView;->sYAll:I

    iget v8, p0, Lcom/tpcstld/twozerogame/MainView;->eYAll:I

    invoke-virtual {v6, v0, v7, v5, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 183
    iget-object v5, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 184
    iget-object v5, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/tpcstld/twozerogame/MainView;->titleTextSize:F

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 185
    iget-object v5, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/tpcstld/twozerogame/base/R$color;->text_brown:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/tpcstld/twozerogame/base/R$string;->high_score:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    add-int/2addr v0, v3

    int-to-float v0, v0

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->titleStartYAll:I

    int-to-float v3, v3

    iget-object v6, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v0, v3, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 187
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 188
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/tpcstld/twozerogame/base/R$color;->text_white:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 189
    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v5, v3, Lcom/tpcstld/twozerogame/MainGame;->highScore:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->bodyStartYAll:I

    int-to-float v5, v5

    iget-object v6, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 193
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->sYAll:I

    iget v5, p0, Lcom/tpcstld/twozerogame/MainView;->eYAll:I

    invoke-virtual {v0, v1, v3, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 194
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 195
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->titleTextSize:F

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 196
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/tpcstld/twozerogame/base/R$color;->text_brown:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 197
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/tpcstld/twozerogame/base/R$string;->score:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    add-int/2addr v1, v4

    int-to-float v1, v1

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->titleStartYAll:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 198
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 199
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/tpcstld/twozerogame/base/R$color;->text_white:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 200
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-wide v2, v0, Lcom/tpcstld/twozerogame/MainGame;->score:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyStartYAll:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawUndoButton(Landroid/graphics/Canvas;)V
    .locals 9

    .line 233
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->backgroundRectangle:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->sXUndo:I

    iget v4, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int v5, v3, v0

    add-int v6, v4, v0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    .line 241
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->ic_action_undo:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->sXUndo:I

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->iconPaddingSize:I

    add-int v5, v0, v1

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    add-int v6, v2, v1

    iget v3, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    add-int/2addr v0, v3

    sub-int v7, v0, v1

    add-int/2addr v2, v3

    sub-int v8, v2, v1

    move-object v2, p0

    move-object v3, p1

    .line 240
    invoke-direct/range {v2 .. v8}, Lcom/tpcstld/twozerogame/MainView;->drawDrawable(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIII)V

    return-void
.end method

.method private getCellRectangleIds()[I
    .locals 3

    const/16 v0, 0x15

    .line 457
    new-array v0, v0, [I

    .line 458
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle:I

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 459
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_2:I

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 460
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_4:I

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 461
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_8:I

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 462
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_16:I

    const/4 v2, 0x4

    aput v1, v0, v2

    .line 463
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_32:I

    const/4 v2, 0x5

    aput v1, v0, v2

    .line 464
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_64:I

    const/4 v2, 0x6

    aput v1, v0, v2

    .line 465
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_128:I

    const/4 v2, 0x7

    aput v1, v0, v2

    .line 466
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_256:I

    const/16 v2, 0x8

    aput v1, v0, v2

    .line 467
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_512:I

    const/16 v2, 0x9

    aput v1, v0, v2

    .line 468
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_1024:I

    const/16 v2, 0xa

    aput v1, v0, v2

    .line 469
    sget v1, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_2048:I

    const/16 v2, 0xb

    aput v1, v0, v2

    const/16 v1, 0xc

    .line 470
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 471
    sget v2, Lcom/tpcstld/twozerogame/base/R$drawable;->cell_rectangle_4096:I

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getLayout(II)V
    .locals 9

    .line 504
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    div-int/lit8 v0, p1, 0x5

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    div-int/lit8 v1, p2, 0x7

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    .line 505
    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    div-int/lit8 v1, v0, 0x7

    iput v1, p0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    .line 506
    div-int/lit8 p1, p1, 0x2

    .line 507
    div-int/lit8 p2, p2, 0x2

    .line 508
    div-int/lit8 v1, v0, 0x2

    add-int/2addr p2, v1

    .line 509
    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    .line 512
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 513
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    int-to-double v0, p1

    .line 514
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    add-int v3, p1, v2

    int-to-double v3, v3

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v3, v0, v3

    div-int/lit8 v7, v2, 0x2

    int-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v3, v7

    double-to-int v3, v3

    iput v3, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    add-int v3, p1, v2

    int-to-double v3, v3

    .line 515
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v3

    div-int/lit8 v3, v2, 0x2

    int-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v3

    double-to-int v0, v0

    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    int-to-double v0, p2

    add-int p2, p1, v2

    int-to-double v3, p2

    .line 516
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v3, v0, v3

    div-int/lit8 p2, v2, 0x2

    int-to-double v7, p2

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v3, v7

    double-to-int p2, v3

    iput p2, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    add-int p2, p1, v2

    int-to-double v3, p2

    .line 517
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v3

    div-int/lit8 v2, v2, 0x2

    int-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-int p2, v0

    iput p2, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    .line 519
    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    sub-int/2addr p2, v0

    int-to-float p2, p2

    .line 522
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 523
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    mul-int v0, p1, p1

    int-to-float v0, v0

    int-to-float p1, p1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    const-string v2, "0000"

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    div-float/2addr v0, p1

    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    .line 525
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 526
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    const/high16 v0, 0x447a0000    # 1000.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 527
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    .line 528
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/tpcstld/twozerogame/base/R$string;->instructions:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    div-float p1, p2, p1

    mul-float p1, p1, v0

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    const/high16 v2, 0x3fc00000    # 1.5f

    div-float/2addr v1, v2

    .line 527
    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->instructionsTextSize:F

    .line 531
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    mul-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    sub-float p1, p2, p1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    .line 533
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/tpcstld/twozerogame/base/R$string;->game_over:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    div-float/2addr p1, v1

    mul-float p1, p1, v0

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v1, v1, v2

    .line 532
    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->gridWidth:I

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr p2, v1

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    .line 536
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/tpcstld/twozerogame/base/R$string;->you_win:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    div-float/2addr p2, v1

    mul-float p2, p2, v0

    .line 531
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->gameOverTextSize:F

    .line 539
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 540
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->textSize:F

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->cellTextSize:F

    const/high16 p2, 0x40400000    # 3.0f

    div-float v0, p1, p2

    .line 541
    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->titleTextSize:F

    float-to-double v0, p1

    const-wide/high16 v3, 0x3ff8000000000000L    # 1.5

    .line 542
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v3

    double-to-int v0, v0

    int-to-float v0, v0

    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    mul-float v0, p1, v2

    .line 543
    iput v0, p0, Lcom/tpcstld/twozerogame/MainView;->headerTextSize:F

    div-float p2, p1, p2

    float-to-int p2, p2

    .line 544
    iput p2, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    const/high16 p2, 0x40a00000    # 5.0f

    div-float/2addr p1, p2

    float-to-int p1, p1

    .line 545
    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->iconPaddingSize:I

    .line 547
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->titleTextSize:F

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 549
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result p1

    .line 551
    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    int-to-double v0, p2

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->cellSize:I

    int-to-double v5, p2

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v3

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v0, v5

    double-to-int p2, v0

    iput p2, p0, Lcom/tpcstld/twozerogame/MainView;->sYAll:I

    .line 552
    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->sYAll:I

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    add-int/2addr p2, v0

    int-to-float p2, p2

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->titleTextSize:F

    div-float v3, v1, v2

    add-float/2addr p2, v3

    int-to-float p1, p1

    sub-float/2addr p2, p1

    float-to-int p1, p2

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->titleStartYAll:I

    .line 553
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->titleStartYAll:I

    add-int/2addr p1, v0

    int-to-float p1, p1

    div-float/2addr v1, v2

    add-float/2addr p1, v1

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    div-float/2addr p2, v2

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->bodyStartYAll:I

    .line 555
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/tpcstld/twozerogame/base/R$string;->high_score:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->titleWidthHighScore:I

    .line 556
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/tpcstld/twozerogame/base/R$string;->score:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->titleWidthScore:I

    .line 557
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 558
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->centerText()I

    move-result p1

    .line 559
    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyStartYAll:I

    add-int/2addr p2, p1

    int-to-float p1, p2

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->bodyTextSize:F

    div-float/2addr p2, v2

    add-float/2addr p1, p2

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->textPaddingSize:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->eYAll:I

    .line 561
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->eYAll:I

    add-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x2

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->iconSize:I

    div-int/lit8 v0, p2, 0x2

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->sYIcons:I

    .line 562
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    .line 563
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->sXNewGame:I

    mul-int/lit8 p2, p2, 0x3

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, p2

    iget p2, p0, Lcom/tpcstld/twozerogame/MainView;->iconPaddingSize:I

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/tpcstld/twozerogame/MainView;->sXUndo:I

    .line 564
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->resyncTime()V

    return-void
.end method

.method private static log2(I)I
    .locals 0

    if-lez p0, :cond_0

    .line 101
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p0

    rsub-int/lit8 p0, p0, 0x1f

    return p0

    .line 100
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method private tick()V
    .locals 5

    .line 494
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 495
    iget-object v2, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v2, v2, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    iget-wide v3, p0, Lcom/tpcstld/twozerogame/MainView;->lastFPSTime:J

    sub-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Lcom/tpcstld/twozerogame/AnimationGrid;->tickAll(J)V

    .line 496
    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainView;->lastFPSTime:J

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 108
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->background:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/tpcstld/twozerogame/MainView;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 110
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawScoreText(Landroid/graphics/Canvas;)V

    .line 112
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainGame;->isActive()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/AnimationGrid;->isAnimationActive()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 113
    invoke-direct {p0, p1, v0}, Lcom/tpcstld/twozerogame/MainView;->drawNewGameButton(Landroid/graphics/Canvas;Z)V

    .line 116
    :cond_0
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawCells(Landroid/graphics/Canvas;)V

    .line 118
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainGame;->isActive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 119
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawEndGameState(Landroid/graphics/Canvas;)V

    .line 122
    :cond_1
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/MainGame;->canContinue()Z

    move-result v0

    if-nez v0, :cond_2

    .line 123
    invoke-direct {p0, p1}, Lcom/tpcstld/twozerogame/MainView;->drawEndlessText(Landroid/graphics/Canvas;)V

    .line 127
    :cond_2
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainGame;->aGrid:Lcom/tpcstld/twozerogame/AnimationGrid;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/AnimationGrid;->isAnimationActive()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 128
    iget p1, p0, Lcom/tpcstld/twozerogame/MainView;->startingX:I

    iget v0, p0, Lcom/tpcstld/twozerogame/MainView;->startingY:I

    iget v1, p0, Lcom/tpcstld/twozerogame/MainView;->endingX:I

    iget v2, p0, Lcom/tpcstld/twozerogame/MainView;->endingY:I

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/tpcstld/twozerogame/MainView;->invalidate(IIII)V

    .line 129
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->tick()V

    goto :goto_0

    .line 131
    :cond_3
    iget-object p1, p0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->isActive()Z

    move-result p1

    if-nez p1, :cond_4

    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/MainView;->refreshLastTime:Z

    if-eqz p1, :cond_4

    .line 132
    invoke-virtual {p0}, Lcom/tpcstld/twozerogame/MainView;->invalidate()V

    const/4 p1, 0x0

    .line 133
    iput-boolean p1, p0, Lcom/tpcstld/twozerogame/MainView;->refreshLastTime:Z

    :cond_4
    :goto_0
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 139
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 140
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/MainView;->getLayout(II)V

    .line 141
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->createBitmapCells()V

    .line 142
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/MainView;->createBackgroundBitmap(II)V

    .line 143
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/MainView;->createOverlays()V

    return-void
.end method

.method public resyncTime()V
    .locals 2

    .line 500
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/MainView;->lastFPSTime:J

    return-void
.end method
