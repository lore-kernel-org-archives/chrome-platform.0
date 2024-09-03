Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9318890E
	for <chrome-platform@lists.linux.dev>; Tue,  3 Sep 2024 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381041; cv=none; b=LOZyZowPJEMDiKCfUik/9giuyUhVaXg7JXXsj7O3EgD4fFZUMDpexfoYecwBa/FPDLOU8UYSU/HN7gR/Hoh5cCdd3ToTvFYkFbIOB3ayZ2oKGrp6/MPLzoiIq9/WT02DFUg12QyujI/UMN89Fii+3cNthlD4eo4IlIxtWCTiIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381041; c=relaxed/simple;
	bh=fTy0stzS7yha36slypwt20Uo6AK6glJZ8X0uewkOtAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihseYptzDjO3GmQf7hrj2vaYq9A6+WbggJ2SsH+tFqO+V9M42RfFMXI729mvKuhF6u7YFWla2k67EFJccgVAZL7unEmLyDkYkmncApTUNnZ283exm+11DCPtpujNefMG1WQpTNJkYkcYKkx2lQEp64wP0qd803dZ/u28RUoKgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jc+dXEQe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jc+dXEQe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c210e23651so5877037a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 03 Sep 2024 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381038; x=1725985838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUgbNEkhKAhMTH2sDvk5W7gqHhDqqd1S8pfms1rAE3M=;
        b=Jc+dXEQecXCZbFZvOjsL1AWUQ1QidOWAf2PEauPGikDnmAT+DyxKxMrynVoYs0JCVT
         WGKsMMARU4ccAKR77y0/lCgIZwg6qacDYe/Da/4OledHnavioJYSj9ucxM6NZxbDxYKX
         NaVpEG+n4yzwKroDVWLSlTIzaB4EwblE7pjeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381038; x=1725985838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUgbNEkhKAhMTH2sDvk5W7gqHhDqqd1S8pfms1rAE3M=;
        b=q3obBY2/cNuLqwgyp3PCmATFY7l26My9l50TTV6gLNuB59OLMLrBrRjqiwRWPxLweI
         QxkjXm75trb+dwIDbaGPIf2hZ96Q8YE+u90AavHFir2RFgZV37Bi3rIEqv0U8dmdAZOy
         hd6CeiI7NgQrAOmXPdm7wkHipZ/gtb5Z9yQVmdBqu9yjrT23CjU5ljhEBkW5x9sjiKst
         u/4UcGWfwsrqZDnZIuMTlpcBKC94FR/6Gu5qdVSSsgyxjdDhiZ4V4yDy3xh0AXlzDUEF
         4HbksJX42A4tAU74ipv2tCmN83BuOhlByl21m7k2Nz3XcBYA4UcQcgANerGjPtdlqtky
         zBVA==
X-Forwarded-Encrypted: i=1; AJvYcCXKc4ITgGf94K0x9I2iDeDuwHz6uBSeoBtZL/TOHHkPKnBS2oGb07z3EDWPU/SVX134RjbaSmTkWDA2DYP190M=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc0jA43vFpJt6uCsyxBlTnB3D3WGToGj2uWdzwyfLV9YUknqOQ
	wVtWiQOzBCjomSAFTZlTJVcVl61XNRGHuXdLNL0LIrF3leBC0Q2uAHBVpMjT
X-Google-Smtp-Source: AGHT+IEpqLZizoWT23KCkNz8O9QOEGS3Ya+RF47OFDRd3WiRqN+a/JFqMC37tQh7DBKbDOaj741jFA==
X-Received: by 2002:a17:907:980c:b0:a86:8f57:7de0 with SMTP id a640c23a62f3a-a89a37aa9famr994346366b.49.1725381037969;
        Tue, 03 Sep 2024 09:30:37 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:37 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 2/8] platform/chrome: Update EC feature flags
Date: Tue,  3 Sep 2024 16:30:27 +0000
Message-ID: <20240903163033.3170815-3-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
driver. Also, add any feature flags that are implemented by the EC
but are missing in the kernel header.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 08b6c98ed890..2998d956ba14 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1312,6 +1312,38 @@ enum ec_feature_code {
 	 * The EC supports the AP composing VDMs for us to send.
 	 */
 	EC_FEATURE_TYPEC_AP_VDM_SEND = 46,
+	/*
+	 * The EC supports system safe mode panic recovery.
+	 */
+	EC_FEATURE_SYSTEM_SAFE_MODE = 47,
+	/*
+	 * The EC will reboot on runtime assertion failures.
+	 */
+	EC_FEATURE_ASSERT_REBOOTS = 48,
+	/*
+	 * The EC image is built with tokenized logging enabled.
+	 */
+	EC_FEATURE_TOKENIZED_LOGGING = 49,
+	/*
+	 * The EC supports triggering an STB dump.
+	 */
+	EC_FEATURE_AMD_STB_DUMP = 50,
+	/*
+	 * The EC supports memory dump commands.
+	 */
+	EC_FEATURE_MEMORY_DUMP = 51,
+	/*
+	 * The EC supports DP2.1 capability
+	 */
+	EC_FEATURE_TYPEC_DP2_1 = 52,
+	/*
+	 * The MCU is System Companion Processor Core 1
+	 */
+	EC_FEATURE_SCP_C1 = 53,
+	/*
+	 * The EC supports UCSI PPM.
+	 */
+	EC_FEATURE_UCSI_PPM = 54,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
-- 
2.46.0.469.g59c65b2a67-goog

