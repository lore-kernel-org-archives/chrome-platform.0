Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4D18B498
	for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963341; cv=none; b=j5185W5fyUnNluJLPDV2X4yzwKr3bC4cjsZOeQDZ4U0FMN/wl7vegpM2ZKYPs791HmIVZabBKdecZSSrAxWVZ4tJ8VSK2+J+sA+4DM1yT7L3537ToyMZKFR1xGRxwhzCy9FsvxtubSMLzaKTqKdiN6B0pWiV3HmE7cJmr9pIKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963341; c=relaxed/simple;
	bh=+8hk+kJmR2SsDvw10WpS8DsYjndB+0n7l87NsIhLzJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URjv+6Mddqp8VBSjZHAln0SSwDZ5cFViBmgMQ8DLVDxlbpvFfhRVyR8fxMVbEWp8Cv+AxaBicNV0qXPb+ZZH5+0Y/XGva45XAR2bLeC2niOC8BVRH/F24ePRjTSAxVdyZO79aZyX/uFu9wMZ2sRSKNL0xG57pMRKsy53bzM3MTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ifJvFpb5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ifJvFpb5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d3e662791so168206266b.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963338; x=1726568138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83DCmEuq7JrWTmbULmBpjHQMPEO/K0lZCYAd0BrN8Kc=;
        b=ifJvFpb5h1+O31jefp3u7g8zbfBMc74j1k8qn1a48FZdbsunAVH/A0oQFMjqgYojk9
         i4ZuiuCVPHZHZG3LGF2lujqr8mDaUVCiOHd+MNzeGUbcioTeTYPE6d/ttSCo5snN64py
         x5ZtbPh76fwQy/lK9vRqe4PRn+YCWkgUTCPu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963338; x=1726568138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83DCmEuq7JrWTmbULmBpjHQMPEO/K0lZCYAd0BrN8Kc=;
        b=JkfQrQFNtMny46NWWA+WNkUcmAbBYbmEy5iSRS6JQKJ5jTwp2j+jMPdxmbp8ZJ3Nil
         tlBT9QzMS0dSq26lcIxoUjjW4QUI0wNDRC9VtR8XPO8+Fv9irDW3qURWTN3A98snIY5c
         pMUiBEMW/bF6f3//cQX1tpmNpSB7JY8yWpUJMcElkaXp/pUMTROex1vdLGaPuQc4JaHX
         jrm/z2RJTSuKydfnc+/TMfhOEuWh+wPPUiB/oORRi0X25Zcq7WhQEiucQd58Fe5KD8jN
         ThLQiQ8eIWyLoxXlNAb5DszGHjh81qdrlwfHSUD6dn7ObDR0S+aRnvh1C9IZ7B8X4xEh
         lXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXihAM7a0gDgCLb8hczoKR3q9Di8MZ9xf/GZO6ymI6DF7xCIErqm5BBnxfdmAVAWxffHzLNgkJYsiUjjjESmwY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6E6EI4VU6hV7+8NSUpo44klv+1z2RiNLZa5t7y5UlMIkYCg3h
	CAIqY1HwVVnEUDCXCCSSbABA3IHQ2ueySxnfITfxOPq7OklMWUjuZsL6l/NB
X-Google-Smtp-Source: AGHT+IHE4rrZXnsK6QRB1ACp9FxoMImuTXf20860U02c9qcu6cfe7aWIFZs39uplA7VdzTCrQ45ZPg==
X-Received: by 2002:a05:6402:360a:b0:5c2:6a73:d13b with SMTP id 4fb4d7f45d1cf-5c3dc7c02d8mr12419030a12.34.1725963336780;
        Tue, 10 Sep 2024 03:15:36 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:36 -0700 (PDT)
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
Subject: [PATCH v6 2/8] platform/chrome: Update EC feature flags
Date: Tue, 10 Sep 2024 10:15:21 +0000
Message-ID: <20240910101527.603452-3-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
driver. Also, add any feature flags that are implemented by the EC
but are missing in the kernel header.

Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 8dbb6a769e4f..ecf290a0c98f 100644
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
2.46.0.598.g6f2099f65c-goog

