.class public Lcom/android/server/DualBatteryService;
.super Landroid/os/IDualBatteryService$Stub;
.source "DualBatteryService.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final FILE_LINES:I = 0x80

.field private static final GET_STATUS_FILE:Ljava/lang/String; = "/sys/devices/platform/dual-battery/driver/status"

.field private static final INTENT_ACTION:Ljava/lang/String; = "android.intent.action.ACTION_DUAL_BATTERY_CHANGED"

.field private static final SET_POWER_BAT_FILE:Ljava/lang/String; = "/sys/devices/platform/dual-battery/driver/power_bat"

.field private static final SET_THD1_FILE:Ljava/lang/String; = "/sys/devices/platform/dual-battery/driver/set_thd1"

.field private static final SET_THD2_FILE:Ljava/lang/String; = "/sys/devices/platform/dual-battery/driver/set_thd2"

.field private static final TAG:Ljava/lang/String; = "leish:DualBatteryService"


# instance fields
.field private mAllowUserSetFlag:I

.field private mBatALevel:I

.field private mBatAVoltage:I

.field private mBatBLevel:I

.field private mBatBVoltage:I

.field private mBatteryPresentStatus:I

.field private final mContext:Landroid/content/Context;

.field mDualBatteryTimer:Ljava/util/Timer;

.field mDualBatteryTimerTask:Ljava/util/TimerTask;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mInternalChangeStatus:I

.field private mInvalidCharger:I

.field private mInvalidChargerObserver:Landroid/os/UEventObserver;

.field private mPmicChangeStatus:I

.field private mPreserve1:I

.field private mPreserve2:I

.field private mReadData:[I

.field private mSendBatteryLow:I

.field private mSendShutDown:I

.field private mSentLowBatteryBroadcast:Z

.field private mSentShutdownBroadcast:Z

.field private mSupplyPowerBattery:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/os/IDualBatteryService$Stub;-><init>()V

    iput-boolean v0, p0, Lcom/android/server/DualBatteryService;->mSentLowBatteryBroadcast:Z

    iput-boolean v0, p0, Lcom/android/server/DualBatteryService;->mSentShutdownBroadcast:Z

    iput-object v1, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimer:Ljava/util/Timer;

    iput-object v1, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimerTask:Ljava/util/TimerTask;

    new-instance v0, Lcom/android/server/DualBatteryService$1;

    invoke-direct {v0, p0}, Lcom/android/server/DualBatteryService$1;-><init>(Lcom/android/server/DualBatteryService;)V

    iput-object v0, p0, Lcom/android/server/DualBatteryService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/android/server/DualBatteryService$3;

    invoke-direct {v0, p0}, Lcom/android/server/DualBatteryService$3;-><init>(Lcom/android/server/DualBatteryService;)V

    iput-object v0, p0, Lcom/android/server/DualBatteryService;->mInvalidChargerObserver:Landroid/os/UEventObserver;

    const-string v0, "leish:DualBatteryService"

    const-string v1, "DualBatteryService"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x80

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    iput-object p1, p0, Lcom/android/server/DualBatteryService;->mContext:Landroid/content/Context;

    new-instance v6, Landroid/content/IntentFilter;

    invoke-direct {v6}, Landroid/content/IntentFilter;-><init>()V

    .local v6, f:Landroid/content/IntentFilter;
    const-string v0, "android.intent.action.SCREEN_ON"

    invoke-virtual {v6, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v6, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimer:Ljava/util/Timer;

    invoke-direct {p0}, Lcom/android/server/DualBatteryService;->getNewTimerTask()Ljava/util/TimerTask;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimerTask:Ljava/util/TimerTask;

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/android/server/DualBatteryService;->mDualBatteryTimerTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v1, "/sys/devices/virtual/switch/invalid_charger/state"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "leish:DualBatteryService"

    const-string v1, "startObserving"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mInvalidChargerObserver:Landroid/os/UEventObserver;

    const-string v1, "DEVPATH=/devices/virtual/switch/invalid_charger"

    invoke-virtual {v0, v1}, Landroid/os/UEventObserver;->startObserving(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/DualBatteryService;)Ljava/util/TimerTask;
    .locals 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/DualBatteryService;->getNewTimerTask()Ljava/util/TimerTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/DualBatteryService;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/DualBatteryService;->sendIntentDualBatteryStatus()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/DualBatteryService;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/DualBatteryService;->sendIntentBatteryLow()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/DualBatteryService;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/DualBatteryService;->sendIntentShutDown()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/server/DualBatteryService;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mInvalidCharger:I

    return v0
.end method

.method static synthetic access$402(Lcom/android/server/DualBatteryService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/DualBatteryService;->mInvalidCharger:I

    return p1
.end method

.method private getNewTimerTask()Ljava/util/TimerTask;
    .locals 1

    .prologue
    new-instance v0, Lcom/android/server/DualBatteryService$2;

    invoke-direct {v0, p0}, Lcom/android/server/DualBatteryService$2;-><init>(Lcom/android/server/DualBatteryService;)V

    return-object v0
.end method

.method private final readerFileData(Ljava/lang/String;)I
    .locals 7
    .parameter "file"

    .prologue
    const-string v3, "0"

    .local v3, readString:Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .local v2, localFileReader:Ljava/io/FileReader;
    new-instance v1, Ljava/io/BufferedReader;

    const/16 v4, 0x20

    invoke-direct {v1, v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .local v1, localBufferedReader:Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v2           #localFileReader:Ljava/io/FileReader;
    :goto_0
    const-string v4, "leish:DualBatteryService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "readerFileData:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    return v4

    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    const-string v4, "leish:DualBatteryService"

    const-string v5, "IO Exception when reader dual battery data"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private final readerFileMultiLineData(Ljava/lang/String;)V
    .locals 8
    .parameter "file"

    .prologue
    const-string v3, "0"

    .local v3, lineString:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, lineIndex:I
    :try_start_0
    new-instance v5, Ljava/io/FileReader;

    invoke-direct {v5, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .local v5, localFileReader:Ljava/io/FileReader;
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .local v4, localBufferedReader:Ljava/io/BufferedReader;
    move v2, v1

    .end local v1           #lineIndex:I
    .local v2, lineIndex:I
    :goto_0
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    const/16 v6, 0x80

    if-ge v2, v6, :cond_0

    iget-object v6, p0, Lcom/android/server/DualBatteryService;->mReadData:[I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v1, v2, 0x1

    .end local v2           #lineIndex:I
    .restart local v1       #lineIndex:I
    :try_start_2
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    aput v7, v6, v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move v2, v1

    .end local v1           #lineIndex:I
    .restart local v2       #lineIndex:I
    goto :goto_0

    :cond_0
    :try_start_3
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move v1, v2

    .end local v2           #lineIndex:I
    .end local v4           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v5           #localFileReader:Ljava/io/FileReader;
    .restart local v1       #lineIndex:I
    :goto_1
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    :goto_2
    const-string v6, "leish:DualBatteryService"

    const-string v7, "IO Exception when reader dual battery data"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #lineIndex:I
    .restart local v2       #lineIndex:I
    .restart local v4       #localBufferedReader:Ljava/io/BufferedReader;
    .restart local v5       #localFileReader:Ljava/io/FileReader;
    :catch_1
    move-exception v0

    move v1, v2

    .end local v2           #lineIndex:I
    .restart local v1       #lineIndex:I
    goto :goto_2
.end method

.method private final sendIntentBatteryLow()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x800

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget v1, p0, Lcom/android/server/DualBatteryService;->mSendBatteryLow:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/android/server/DualBatteryService;->mPmicChangeStatus:I

    if-nez v1, :cond_2

    iget v1, p0, Lcom/android/server/DualBatteryService;->mInternalChangeStatus:I

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/android/server/DualBatteryService;->mSentLowBatteryBroadcast:Z

    if-nez v1, :cond_0

    const-string v1, "leish:DualBatteryService"

    const-string v2, "sendIntentBatteryLow:ACTION_BATTERY_LOW"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "android.intent.action.BATTERY_LOW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/server/DualBatteryService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_0
    iput-boolean v3, p0, Lcom/android/server/DualBatteryService;->mSentLowBatteryBroadcast:Z

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-boolean v1, p0, Lcom/android/server/DualBatteryService;->mSentLowBatteryBroadcast:Z

    if-eqz v1, :cond_1

    const-string v1, "leish:DualBatteryService"

    const-string v2, "sendIntentBatteryLow:ACTION_BATTERY_OKAY"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/server/DualBatteryService;->mSentLowBatteryBroadcast:Z

    const-string v1, "android.intent.action.BATTERY_OKAY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/server/DualBatteryService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private final sendIntentDualBatteryStatus()V
    .locals 5

    .prologue
    const-string v2, "leish:DualBatteryService"

    const-string v3, ">>>sendIntent"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.ACTION_DUAL_BATTERY_CHANGED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent:Landroid/content/Intent;
    const/high16 v2, 0x4000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v2, "power_bat"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mSupplyPowerBattery:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "present_bat"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mBatteryPresentStatus:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "batA_level"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mBatALevel:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "batB_level"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mBatBLevel:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "batA_voltage"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mBatAVoltage:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "batB_voltage"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mBatBVoltage:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "pmic_change"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mPmicChangeStatus:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "internal_change"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mInternalChangeStatus:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "allow_set"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mAllowUserSetFlag:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "preserve1"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mPreserve1:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "preserve2"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mPreserve2:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "invalid_charger"

    iget v3, p0, Lcom/android/server/DualBatteryService;->mInvalidCharger:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "leish:DualBatteryService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mInvalidCharger:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/DualBatteryService;->mInvalidCharger:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "leish:DualBatteryService"

    const-string v3, "<<<sendIntent"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, ""

    .local v1, pmic:Ljava/lang/String;
    iget v2, p0, Lcom/android/server/DualBatteryService;->mPmicChangeStatus:I

    if-nez v2, :cond_0

    const-string v1, "nocharge"

    :goto_0
    const-string v2, "leish:DualBatteryService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Amoi dual "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-static {v0, v2, v3}, Landroid/app/ActivityManagerNative;->broadcastStickyIntent(Landroid/content/Intent;Ljava/lang/String;I)V

    return-void

    :cond_0
    const-string v1, "charge"

    goto :goto_0
.end method

.method private final sendIntentShutDown()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    iget v1, p0, Lcom/android/server/DualBatteryService;->mSendShutDown:I

    if-ne v1, v4, :cond_1

    invoke-static {}, Landroid/app/ActivityManagerNative;->isSystemReady()Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/android/server/DualBatteryService;->mPmicChangeStatus:I

    if-nez v1, :cond_1

    iget v1, p0, Lcom/android/server/DualBatteryService;->mInternalChangeStatus:I

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/android/server/DualBatteryService;->mSentShutdownBroadcast:Z

    if-nez v1, :cond_0

    const-string v1, "leish:DualBatteryService"

    const-string v2, "sendIntentShutDown:ACTION_REQUEST_SHUTDOWN"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v4, p0, Lcom/android/server/DualBatteryService;->mSentShutdownBroadcast:Z

    const-string v1, "sys.ipo.battlow"

    const-string v2, "1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.ACTION_REQUEST_SHUTDOWN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.extra.KEY_CONFIRM"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/server/DualBatteryService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-boolean v3, p0, Lcom/android/server/DualBatteryService;->mSentShutdownBroadcast:Z

    goto :goto_0
.end method

.method private final writerFileData(Ljava/lang/String;I)V
    .locals 7
    .parameter "file"
    .parameter "data"

    .prologue
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .local v3, writerString:Ljava/lang/String;
    const-string v4, "leish:DualBatteryService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "writerFileData:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    const/4 v4, 0x0

    invoke-direct {v2, p1, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    .local v2, localFileWriter:Ljava/io/FileWriter;
    new-instance v1, Ljava/io/BufferedWriter;

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .local v1, localBufferedWriter:Ljava/io/BufferedWriter;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V

    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1           #localBufferedWriter:Ljava/io/BufferedWriter;
    .end local v2           #localFileWriter:Ljava/io/FileWriter;
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    const-string v4, "leish:DualBatteryService"

    const-string v5, "IO Exception when writer dual battery data"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public getAllowUserSetFlag()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mAllowUserSetFlag:I

    .local v0, flag:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAllowUserSetFlag:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getBatALevel()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mBatALevel:I

    .local v0, level:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBatALevel:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getBatAVoltage()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mBatAVoltage:I

    .local v0, voltage:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBatAVoltage:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getBatBLevel()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mBatBLevel:I

    .local v0, level:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBatBLevel:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getBatBVoltage()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mBatBVoltage:I

    .local v0, voltage:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBatBVoltage:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getBatteryPresentStatus()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mBatteryPresentStatus:I

    .local v0, status:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBatteryPresentStatus:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getInternalChangeStatus()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mInternalChangeStatus:I

    .local v0, status:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getInternalChangeStatus:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getPmicChangeStatus()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mPmicChangeStatus:I

    .local v0, status:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getPmicChangeStatus:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getPreserve1()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mPreserve1:I

    .local v0, flag:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getPreserve1:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getPreserve2()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mPreserve2:I

    .local v0, flag:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getPreserve1:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public getSupplyPowerBattery()I
    .locals 4

    .prologue
    iget v0, p0, Lcom/android/server/DualBatteryService;->mSupplyPowerBattery:I

    .local v0, battery:I
    const-string v1, "leish:DualBatteryService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getSupplyPowerBattery:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public readDualBatteryStatus()V
    .locals 2

    .prologue
    const-string v0, "leish:DualBatteryService"

    const-string v1, "readDualBatteryStatus"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "/sys/devices/platform/dual-battery/driver/status"

    invoke-direct {p0, v0}, Lcom/android/server/DualBatteryService;->readerFileMultiLineData(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mSupplyPowerBattery:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mBatteryPresentStatus:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mBatALevel:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x3

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mBatBLevel:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x4

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mBatAVoltage:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x5

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mBatBVoltage:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x6

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mPmicChangeStatus:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/4 v1, 0x7

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mInternalChangeStatus:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/16 v1, 0x8

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mAllowUserSetFlag:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/16 v1, 0x9

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mSendBatteryLow:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/16 v1, 0xa

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mSendShutDown:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/16 v1, 0xb

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mPreserve1:I

    iget-object v0, p0, Lcom/android/server/DualBatteryService;->mReadData:[I

    const/16 v1, 0xc

    aget v0, v0, v1

    iput v0, p0, Lcom/android/server/DualBatteryService;->mPreserve2:I

    return-void
.end method

.method public setSupplyPowerBattery(I)V
    .locals 3
    .parameter "battery"

    .prologue
    const-string v0, "leish:DualBatteryService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSupplyPowerBattery:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "/sys/devices/platform/dual-battery/driver/power_bat"

    invoke-direct {p0, v0, p1}, Lcom/android/server/DualBatteryService;->writerFileData(Ljava/lang/String;I)V

    return-void
.end method

.method public setThd1(I)V
    .locals 3
    .parameter "thd1"

    .prologue
    const-string v0, "leish:DualBatteryService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setThd1:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "/sys/devices/platform/dual-battery/driver/set_thd1"

    invoke-direct {p0, v0, p1}, Lcom/android/server/DualBatteryService;->writerFileData(Ljava/lang/String;I)V

    return-void
.end method

.method public setThd2(I)V
    .locals 3
    .parameter "thd2"

    .prologue
    const-string v0, "leish:DualBatteryService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setThd2:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "/sys/devices/platform/dual-battery/driver/set_thd2"

    invoke-direct {p0, v0, p1}, Lcom/android/server/DualBatteryService;->writerFileData(Ljava/lang/String;I)V

    return-void
.end method
