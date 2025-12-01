Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC130EF80
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591989; cv=none; b=tKO/Qgxj84iICbZOJb7ym5/crSsLJy8b1kd12Zr2PGZm7XsvWoZxGsdKX7F+qBzNQFAAYsY/vrKRDqpioLwfErNT3yp2oYEQ2ucNeRByOG3X3PsTAEnEC08aE6v6g9btZlzogpVhoStjTt7m0iLlGk/ooWZcKPf+ITz2hAtMdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591989; c=relaxed/simple;
	bh=fqrnPd4WduD46/XBBnyXBF4b8D6EY+CUvKdyAZAiwiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdyqBWO6PcvSf0uIdTNiw7zib7NozU6AU52pM3hyCbeFc425chDV9vDIYenurniB57+PV3xyauR3fu5UzwsrHrbgr3rbbm79AjbLoMSRZf1vF07z+ftHl4YS0vpsHjV5Plc4f0DdcDNzi+JKsLXq4Y94tbdwQN+6Z7cG6Nojmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bx3zf98G; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bx3zf98G"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso6141870a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591985; x=1765196785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OH98ZYDJQZtNnl6fPGXU4bT8ZiUExlrTHFtG0JJc9Y=;
        b=bx3zf98GrEBkzk5Udfmw0EHXLPlZh9R8AkJ6GgEPwDVwZJ+umBSp5GrdqqiY98u/mY
         /BvDOaTI6itsbLuAb2ydZnw47Y2IiM0O4mvg7BcrH6DV+POrbhXjmZOrHBWrNzExCulh
         xak6x3vM2+vmLGK+7zRBw9sXA6pTVjyh7+NtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591985; x=1765196785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8OH98ZYDJQZtNnl6fPGXU4bT8ZiUExlrTHFtG0JJc9Y=;
        b=l2vu8lZGIfUeoREp48xzjGjmYpmVixCSD6rDBahDQy4kq5v6/hBQmw79N+D70t0wRP
         wfPjJGUEigdgN18LOzhB3C5bjpM9Vdm5AV+vKv6Z6LbGFLlSFuzKsjXovH6pGlaSywfR
         ozr2wIpALeSwq+q11/DWXJ23VoelkGFYu+pAchFy8YzmLsyIMMmvGZTCd1FGDQ3LMo9p
         QPu+iIwfQoQvN9SnGZKKhsbYnaOBX5cKSq5nam5Li+p3mnjPh/mTTmJolwxzhNcCPAjH
         JTryIO9BP7M7H12puEVWEqFoP0JStJJHga76HEHsLfLW/+o++Lk9Xmzogs/vubvZea+i
         /nBg==
X-Forwarded-Encrypted: i=1; AJvYcCUesOQCBVICzIFBAtkNnepglJRE3nnPBQTXcUl1IPaHujkXvF+F0LIG59/KKn/1hBbedtDMstaF9plz2Cb35NY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx/2z0X8DD5o5sStJCPXWJTY11Iw1buqCEwIfsBO2+FVLSdgSk
	c/hV6m014nUQSYvqhWyvztqaRKYM+jW7eHGr+D+T53tEYnbtUDOnDQEOznwJbuwhCA==
X-Gm-Gg: ASbGncuOP4+xCjIdew/ki2LHt597yjyPPgB2gM9iP7rbDiMlabu+beIl2AN1sH6m6S0
	UYpAGXNoTzwgKPrh3aa13Tge7DNn8BM4T6v2f3R0IUXCAvWEFXKgw2bHCQtwPaQTZxJ3etpXPyE
	MwJNW7cSYXjv4XcfTOXgcljObmpaL7XvkRkm5LCrTsQSGDJz48/ru+U8bkTkTaQ+CambweiBoBd
	+OT7zaOvW6y5wbnJu1jTLyE8KibBLD2ysvIpcL7OtC6+Oh0WY8P+Oqr3jrkO4XPx0yeeXgN5+xz
	oFeSqz0GTKf8NFDJaBUTk2g1NCggJZNZzx9CPpj2A5VGMVrAj/K6sf/VBKHPBBvfGWma2PbPqyA
	dRLZ+sPIJhG9/rOIWBfy4MuiwxT+wOcLZo4jYJ5YZuMr8f2mhHFH6aAlqs5G/RMKowkTDQKdNt2
	vXNgqrsnSk1+PZwwz+woVVav6do5Ub3EuvoFqZ04G54JUVTGruos93KFk0+RkTVcZsbfUEJKPaK
	ANJyutdzD4=
X-Google-Smtp-Source: AGHT+IGnKQdr5PepexfByhiK/VHIvgqI+kwxEyqKKnfjEsKm61/OkPzj8RjDbEc+U2QIWtElauJeDw==
X-Received: by 2002:a17:907:940e:b0:b74:352d:6dc1 with SMTP id a640c23a62f3a-b7671695438mr3121812966b.28.1764591985193;
        Mon, 01 Dec 2025 04:26:25 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:24 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 6/8] usb: typec: ucsi: Implement enter_usb_mode operation
Date: Mon,  1 Dec 2025 12:26:02 +0000
Message-ID: <20251201122604.1268071-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`enter_usb_mode` uses the SET_USB UCSI command to manage USB modes such as
USB3, and USB4 for current and future connections.
It allows port drivers and user-space applications (via the "usb_mode"
partner attribute) to enable and disable USB modes on a connector.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ee96c42e9e27..3d4c277bcd49 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1624,7 +1624,29 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 	return ret;
 }
 
+static int ucsi_enter_usb_mode(struct typec_port *port, enum usb_mode mode)
+{
+	struct ucsi_connector *con = typec_get_drvdata(port);
+	u64 command;
+	int ret;
+
+	command = UCSI_SET_USB | UCSI_CONNECTOR_NUMBER(con->num);
+	if (mode == USB_MODE_USB3)
+		command |= UCSI_USB3_ENABLE;
+	else if (mode == USB_MODE_USB4)
+		command |= UCSI_USB4_ENABLE;
+
+	if (!ucsi_con_mutex_lock(con))
+		return -ENOTCONN;
+	con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(con->ucsi, command);
+	ucsi_con_mutex_unlock(con);
+
+	return ret;
+}
+
 static const struct typec_operations ucsi_ops = {
+	.enter_usb_mode = ucsi_enter_usb_mode,
 	.dr_set = ucsi_dr_swap,
 	.pr_set = ucsi_pr_swap
 };
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 6e77bdbdaeae..a5ef35d9dce5 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -219,6 +219,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
 #define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
 
+/* SET_USB command bits */
+#define UCSI_USB3_ENABLE		((u64)1 << 23)
+#define UCSI_USB4_ENABLE		((u64)1 << 24)
 /* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
-- 
2.52.0.158.g65b55ccf14-goog

