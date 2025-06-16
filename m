Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8D2E06C5
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080804; cv=none; b=nQ99lBX4rRBgoIHRvw95MTQS1VQtFPD5dbx5q6bKXIXteKYWc2DOOJq/Yb0wtOF+6IieWs7H61/eclgdpExoU8bLBwheqLahxwW4sVj3aT/t8CDdoegnBGE4hz2niQg59KQqtcFO/cCFBajlD0ACIHY7jGEGgMpoAOXwSdgani8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080804; c=relaxed/simple;
	bh=0PHI8c4cGupy6mr00/69MtbHFn0M40BQMFD2F7JuKUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKgLT4EFAp9vL8geiKeh4e5teYGneSxJgg1Bh6r9XtaJhZ368k57oXpztHHUjvqg1O9D+Ry613xNTAx76qgxulUqJa7YSdnE78xRMxHGfZmdc31Kynksso12Tw7ogZXJUk2QFJmJqjbr9ReHUNH+oL4upxj/24i33ialChZUyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fCFrzyMQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fCFrzyMQ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so9387908a12.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080801; x=1750685601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhqvBCRWi83ljiiFIoIKKjzL3JwEFntoAes/MRvHbvg=;
        b=fCFrzyMQGIYzmHPTkAK3h6brN7Kyxh2QR6RQ+fk2MXQECRdwbtUOX6up5+2YBAa2EQ
         JGJXVxE5hRL7xSGRymk6SB/4qIcjcro2lWFCmWWrDc5crRwRUCvO//8iGJW1TTwBAi3l
         ZkwER3LQb70GyMd/9hnNfg3CGu7blIIX13IUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080801; x=1750685601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhqvBCRWi83ljiiFIoIKKjzL3JwEFntoAes/MRvHbvg=;
        b=W2MRU3RTugZSWd0i6HFHL9tX04BruO7tzxTweT7RkovoIJZWg/+1/787AFDG4At9Y0
         fK+CrMTYQDtW7FhRzu+WGVS2qcUyb1MLdLkFI0H0s/bGBFv+QaoA/7DGaQowvW3sxjPH
         Bp31DRLd7grSnprzElha27ut9xHN/jg9MyIwb7A2No+HPY2EEztvjE+cWaX/0VRTRcoa
         t/kM55x24hDgUWA9lOB+3tBXPFxITijewaCGJdUO6qc7w+OSfFWMfxW8tZboewHBqNls
         cZP40s2SpjSKW9NzvH1mCsK2dyljxPm6xPykzZq92EmkFIzwXXRztYQDztx+jil2VOWx
         GjTA==
X-Forwarded-Encrypted: i=1; AJvYcCUplb/f98WPrMsC9TrTNTX2mlp0uk/zGwFVkbrqYSq+edqf860SZxWSoz5cFteo2zzkdEatFK5JSYOWWokJ3Do=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvTRCKTvfgWb5sB+D29bNHz9EY0z+9v6hnr2JX8hQj22H3Akqx
	8wKJcwhJQUILZlJXEN2lLTTI7Y/1R7uSguXXbuddV2XLxDRzo+Fm8KL2PJ4MQ8mcCw==
X-Gm-Gg: ASbGncv36DquYVzRVEcfrQW7ZYEMK5A7X8E0Mi1JIcdWoo2GK5Dz/gr3cTpr6UkDj84
	N/qDDPA6QNlg9bzLCYIsQu8GiKnOb4TzTuX47wA0w1LvK+3Yx8at8EwCAoCV0DRjn6GV4Dxw91k
	jlVuS7VJkUgyoE6UQyNt8J44mAWXY/5my9j7IsIdpBUx3PwUotVVPAONjncL14DVqn0YJV1m4gb
	+OZsgx5mzFVbitZEntDgb0FVq7PMQRmB5Hscy9g8CJpd/StBAxaebBrRbuQaHFKGT/uRoi0P0JS
	etc2ycJp5+XW0R/lsWuItyNxf4gCk1KnVzsqKsipzzbyQBhdAYkuVEvGK4kjX88iOyvkOINW7aU
	6oHdaLVniMpnQ70gvAr/jcbh8Jwu/K77S3DTkQWxtZiIsp7E0tydP/AvHhIVJnJu++ohT
X-Google-Smtp-Source: AGHT+IHfbJubtALYX705aMPJAZLadxG+o3H7c51K1HROrB1vOE0jaYQjb3BtZP2Tk8Y8fXZXY/12hQ==
X-Received: by 2002:a05:6402:13d4:b0:606:e754:62bb with SMTP id 4fb4d7f45d1cf-608d09e3938mr8395397a12.28.1750080800769;
        Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 07/10] usb: typec: Report altmode entry status via callback
Date: Mon, 16 Jun 2025 13:31:44 +0000
Message-ID: <20250616133147.1835939-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of an
alternate mode entry attempt.
Call the `typec_mode_selection_altmode_complete()` callback to provide
this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 13 +++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c |  6 ++++++
 include/linux/usb/typec_tbt.h            |  3 +++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index ac84a6d64c2f..946f61b57fa0 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -274,16 +274,20 @@ static void dp_altmode_work(struct work_struct *work)
 		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Status Update command (%d)\n",
 				ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE_PRIME:
 		ret = dp_altmode_configure_vdm_cable(dp, dp->data_prime.conf);
@@ -397,6 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
 			break;
+		case DP_CMD_STATUS_UPDATE:
+			ret = *(int *)vdo;
+			break;
 		default:
 			break;
 		}
@@ -407,6 +414,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 	if (dp->state != DP_STATE_IDLE)
 		schedule_work(&dp->work);
+	else if (ret || cmd == DP_CMD_CONFIGURE)
+		typec_mode_selection_altmode_complete(dp->alt, ret);
 
 err_unlock:
 	mutex_unlock(&dp->lock);
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..697ab6060652 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -242,6 +242,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 			else if (tbt->plug[TYPEC_PLUG_SOP_P])
 				tbt->state = TBT_STATE_SOP_P_EXIT;
 			break;
+		case TBT_CMD_STATUS_UPDATE:
+			typec_mode_selection_altmode_complete(alt, 0);
+			break;
 		}
 		break;
 	case CMDT_RSP_NAK:
@@ -249,6 +252,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
 			break;
+		case TBT_CMD_STATUS_UPDATE:
+			typec_mode_selection_altmode_complete(alt, *(int *)vdo);
+			break;
 		default:
 			break;
 		}
diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 55dcea12082c..57cbda5292bb 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -24,6 +24,9 @@ struct typec_thunderbolt_data {
 	u32 enter_vdo;
 };
 
+/* TBT3 alt mode specific commands */
+#define TBT_CMD_STATUS_UPDATE		VDO_CMD_VENDOR(0)
+
 /* TBT3 Device Discover Mode VDO bits */
 #define TBT_MODE			BIT(0)
 #define TBT_ADAPTER(_vdo_)		FIELD_GET(BIT(16), _vdo_)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

