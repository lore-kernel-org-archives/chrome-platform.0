Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815171547E4
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jan 2025 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735947257; cv=none; b=jMaSpcfGibqQmCNabkiTB5kuBBncd/K5HTHx3+W8Tpak/k6ipG0MMa4aLoKWdOYY0JK/BTJrm4+rZbcN2JOAcT8wp9CCwi9nNtYFjeeK6FWziSQtGJCdnH7u9qzLlXByJ9q7NhSui8UHbyILCiVsyVgaiHcnftXoUAx0ard9NRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735947257; c=relaxed/simple;
	bh=fMQS0lpTVfYzVgsBO0JvCdXFBOEN9z/TrDtHPW6krbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUJSYSEj008/mdJs6m8pLHTrRjs8BvtOUs1FxS3WGec66D9qobD/+4+PjsEs7I1nnwWlk/h1wV/dB+vypJPOdIMhTgRFH4v0mqGeCOzJ3zh98tpqVSA7otSfV7On45LTbOw+BYi19UcfBr0GthfEDVzMqSLrCG8yO5Q7xegaM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IjigHVUX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IjigHVUX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216395e151bso129684675ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jan 2025 15:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735947255; x=1736552055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyfQlF7S/J2q6dkyqD+eoiIOw9yZsS9G60jHXIIn6L4=;
        b=IjigHVUXJKW6raDss0QybdmbKCbhjS9ARmSugNVg7CF2q8vbSelRgWrQq95bToMRif
         TjuttDkAZkLXCSPefBfBi8U8tCaeKxvcy8oYmS0DRj0f3kLCqJZn+V58s1J2o6f23etN
         VFEzF06XPzUsow74QhcG/e/82MYo73ZiV3oaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735947255; x=1736552055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyfQlF7S/J2q6dkyqD+eoiIOw9yZsS9G60jHXIIn6L4=;
        b=QqRx3K+astFrQ9njKxH4IJCtCXnlg5lFGi5dadCy8q3eoxRV3Q89KVyW9gMCnuK7jy
         Y2+hxw0jTqE+Bu6FpsLtWvNjpn/faCX1LP2hiy0Nd5AhuiYaEAuETNZqVxrsWeRuWriS
         C/2zPOhq1jSlaFNmt16brZBgC0vTMha07ZSr50BH7ji77v4Xmk7VTP8yfDhEXtnxIcLg
         nuEJvRsZrr/PpLqKCM46GCVUVA+xfq9l26M+9yYZ/ON5AFhdO3bDbdqBKEPynKu8tCfR
         oYJPOAZyuqitzMvfbNyCFY81axgs8jbrYGwMrm5KqltBWIdvTMvY8P4dyBqpOwQkPzI2
         q2qA==
X-Forwarded-Encrypted: i=1; AJvYcCWNIAYax4IHtsDYCZ3OY75rIFLPhr8Bl7t2sai3/+v6r3CWyYoysOqmuLwxZgsUGMvKH9xLY7wu2U5P0HncPeM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH+uYXHAqPvuRKWZtcBFPlNGaBWrtOACzon7M+LnPiBheuXF1C
	BHdwrFLZPn5VZRoHOyZkXxSNhzRVZVVjmOLPhQKrF/l84/yy85qv+ikTGxAEWw==
X-Gm-Gg: ASbGncu6GXiDk1AHfCOfBHv32kaoQ2hEOdp4xRb0y7wyGEgYP01JadjoYp3xZNM3je8
	ja73/O+AMBYxykI0nDWDqqyTUnBceVcnkHm6DSf3G9ioRm3Js6+veMbMTEOh5h7qlWwenfB4hYr
	3oW+AU/kqFwM4TK6ZB1xHfXiXagfXuGmvQ7ejRskNsnt5ytgIvgP40SwwD4FuOJAQzxeIafOsAQ
	CUy5h10Md2rdoq//RjBkFBKvUj3DDSQfTc8PcXuMssUhGkLj9USBhP3
X-Google-Smtp-Source: AGHT+IGjqxAGJxD6BblVJKULcJXgs9BUWAfbs2PDu0zF614ZdOtQh7BRpcdUVumVougD6FWH1TIBUg==
X-Received: by 2002:a17:902:da8f:b0:215:98e7:9b1 with SMTP id d9443c01a7336-219e6ca6e4amr654541915ad.5.1735947254875;
        Fri, 03 Jan 2025 15:34:14 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9d447fsm242793995ad.128.2025.01.03.15.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 15:34:14 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: ukaszb@chromium.org
Cc: abhishekpandit@chromium.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dmitry.baryshkov@linaro.org,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	jthies@google.com,
	linux-usb@vger.kernel.org,
	pholla@chromium.org,
	tzungbi@kernel.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH] driver/platform/chrome: Update cros_ec_trace with new USCI commands
Date: Fri,  3 Jan 2025 15:34:07 -0800
Message-ID: <20250103233407.4001046-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241231131047.1757434-2-ukaszb@chromium.org>
References: <20241231131047.1757434-2-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add this patch to "platform/chrome: Update ChromeOS EC header for UCSI"
to add the new commands form cros_ec_commands.h in the tracer so that
they are nicely decoded. Enable the tracer with:
cd /sys/kernel/debug/tracing
echo 1 > events/cros_ec/enable
echo 1 > tracing_on
cat trace_pipe

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_trace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index 425e9441b7ca5..ddc6adfb3897a 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -166,6 +166,8 @@
 	TRACE_SYMBOL(EC_CMD_REGULATOR_IS_ENABLED), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_SET_VOLTAGE), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_GET_VOLTAGE), \
+	TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
+	TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
 	TRACE_SYMBOL(EC_CMD_CR51_BASE), \
 	TRACE_SYMBOL(EC_CMD_CR51_LAST), \
 	TRACE_SYMBOL(EC_CMD_FP_PASSTHRU), \
-- 
2.47.1.613.gc27f4b7a9f-goog

