Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F71C19D07B
	for <chrome-platform@lists.linux.dev>; Tue, 31 Dec 2024 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650669; cv=none; b=KBBvnMVpWz43kegBEIBI0uhzqeOtBtU7SUWYLoQ7UQHQ6zdkjojtHlcN7tRv7qVHMgbd6TxRYoACmE0VAipGmEV68yyycLE63CqUQF0zx1attzquY3d17R+Rc+bzAl4cn091O6qlB56Kk6LQpK0GVeN/f0ZLoCUm9vf6HKRetxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650669; c=relaxed/simple;
	bh=oq4btdFfYoK+KOPZMZyUTR9BBLNLACQ2tL4SprBzQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CL/oqvlmM+mFVtse6+EY+6i2BrgVjgl9coERLEykjxlkiLrQue+DPTTVPulNNoCtxE00gm61qdwNUZMzCsYg5gddXyGcRI/iizxUR1B6RSZYWJ70kDUQXN41yA2Sywmk8N+X8erho40evhlMGqzW8puMBFPjH52OVEsXzLOhWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eKRTcFsa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKRTcFsa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so19933488a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 31 Dec 2024 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735650666; x=1736255466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r93btXMaX8NmCzDiaipg7HKDi9wpM1aYEQUfAEojKzw=;
        b=eKRTcFsav5m3QqQQJJ/AzvdU7gbaVxYM5LH8u2ablrD62T80C4FrG6qgOsgzGK2E5p
         894LbAWayLvhCERIqFF8HO8RM2ldefhN0ZeQqoy6UcT851rzRlijhOYjOu5IdmwOEANS
         99xYWktkIBrIgsf1uAXcNyCgC5c1HV4/06MZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650666; x=1736255466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r93btXMaX8NmCzDiaipg7HKDi9wpM1aYEQUfAEojKzw=;
        b=elkgnBb3OG4EawleGkl1D4TFxKYjCyXonOeaZJeWQRqPur+1Cw92/PIQCCVH/klzmS
         Za35aw683CWarPhSHyVOOEVeAJmT8TUfMHSDwDYclzCASBhpP1B7mqOsz3xfalDFFKRK
         4TcQNewniU5kSm9i49DDc73n4Fi7U3c5fjTtSU5Zufj2iMZ4JhCOPx4rA9cs4dKUeJxk
         mGKEmHbVO44460sop+w0y2y5aZB92g8/ikr3PBaZ+evNIHd5XUU/TQ/zEksnLJBqYyyh
         8NKCwuWKommfG5851QYJiOE7iGaEBBEkycTco7jhpo/xzmqazYOWltmIJxPxyBmjfKor
         SqSA==
X-Forwarded-Encrypted: i=1; AJvYcCX3IL2hKitBE3JfjicPk52j4q0XCT84SXRqpToxt+e74aMWsQx+tRf44QT8DSLP7kfgmZ5QCTjjL+/vgN1jsMw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQI20+cI2jgoC/YvB21VvgpsxKCM7n7cq4ZJfuEPkCtZdl2ZDh
	jpSBywwft/t1JcXALeBzEx9uCQ+LY8810khFIr0hZQQkjtPStSaExLSKx5HF
X-Gm-Gg: ASbGncstX8VKcW2nYWMzsvff8+Zm4ExcB6qypd9EjtIf/139nZ9u/mRWVob/9VQTRcd
	iHZ38VPrgALV3F9bAsCucLWJRYrRD21/yJaBTRbzYy/41IAMlYQOqCkBpxcG4O8/u7nLMJUppec
	sHc8dwQZShZTgxwvdvhXFqymhDoAlNmqbil4k5ANZjrmGP24QQ0Se/6P4/uJydBvY25ZRrpnrd4
	NXej54tosji3oqEjt3++pHGddGlutLjDPHeR5SaERs3rNdSOsosu23utjlvu0r5klJnRJgRi/EG
	bDTrv0friy+zp3JIXLuX3l07H9z0yZbU9w67
X-Google-Smtp-Source: AGHT+IF7Fc0a7jHAFV0h7q7TTKwJhn83sqXP1vY17a3omaiWF55P+201IWTK3V3xLQhcuFX+i1p1ng==
X-Received: by 2002:a05:6402:40c8:b0:5d0:e50b:899e with SMTP id 4fb4d7f45d1cf-5d81dd66e0cmr38911487a12.4.1735650666487;
        Tue, 31 Dec 2024 05:11:06 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (60.27.91.34.bc.googleusercontent.com. [34.91.27.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679efc9sm15876651a12.47.2024.12.31.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:11:05 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v12 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue, 31 Dec 2024 13:10:46 +0000
Message-ID: <20241231131047.1757434-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241231131047.1757434-1-ukaszb@chromium.org>
References: <20241231131047.1757434-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index b3c4993e656e..ecf290a0c98f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5044,8 +5044,11 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
+
 struct ec_response_host_event_status {
-	uint32_t status;      /* PD MCU host event status */
+	uint32_t status; /* PD MCU host event status */
 } __ec_align4;
 
 /* Set USB type-C port role and muxes */
@@ -6105,6 +6108,29 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * UCSI OPM-PPM commands
+ *
+ * These commands are used for communication between OPM and PPM.
+ * Only UCSI3.0 is tested.
+ */
+
+#define EC_CMD_UCSI_PPM_SET 0x0140
+
+/* The data size is stored in the host command protocol header. */
+struct ec_params_ucsi_ppm_set {
+	uint16_t offset;
+	uint8_t data[];
+} __ec_align2;
+
+#define EC_CMD_UCSI_PPM_GET 0x0141
+
+/* For 'GET' sub-commands, data will be returned as a raw payload. */
+struct ec_params_ucsi_ppm_get {
+	uint16_t offset;
+	uint8_t size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 
-- 
2.47.1.613.gc27f4b7a9f-goog

