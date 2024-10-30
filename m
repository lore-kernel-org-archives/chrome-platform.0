Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C4217473
	for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323755; cv=none; b=VRa+aF3WhYC4w8cldDjC6j4OCBvWu6JJGPV+h+Szh/Xqis6CeiBqG6zCwFXms32C2FIQKZQG7b7QG1SVgC4zzyjE/pJcPBBx+SKUe9xcysCFwJpXxotrV2oNuC1rtrgxseegeJ2auu4dT9Fqjif1ahtxn39MRNvAtpd36KiXihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323755; c=relaxed/simple;
	bh=0F0599rOKHxfQvf7XtskB5Mt/xYLB1cPEJKxRmRO258=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6PuU8yj7iVJnT/LU+Mcu41cJAKUj0UtHWQzeDGErttbTmyAwQJTi8GUbeYhuKgI33cKIoFeh07LUsY/1n8qMQUoX7PUefRS9G/rYd2SJL3F9zVfqkwE32CN5ryVakcQoSEQqaq3sH+dM5sLN7ZaunJ84LXkqexU+OlFtgWhQiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ared0kQd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ared0kQd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2e050b1c3so1108837a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730323751; x=1730928551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCXmBmJO0w4Chs93Xm3BeF6wgI3Tb8Gd24Xh4PooSyo=;
        b=Ared0kQda9n6q0l33yzokSF9JZBek6jwjo3U8BT2bxNBBphVcVnUoDqs7pyECQjMCZ
         XBSPalZQlPQnXwlJHZE4dR2OJ0f2TFtKeid4+IwPeif0rj+M8uI8Wgpo9C2EbuZjLQUo
         bzl2oezFM0+gsLerDucLyjxxmdg5/T+bPijr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323751; x=1730928551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCXmBmJO0w4Chs93Xm3BeF6wgI3Tb8Gd24Xh4PooSyo=;
        b=e9vWKVjMbsT7/y+NdgxNo1QmS7ky9A8k6WHBXm8+W9wBwpj8WLtY34uhsz95COn49o
         r2Kfo3xj6nWSOAcnEq/0fG+o4o9Op3M2zNvsQDTT4nXrS9LtWrLBRQQO/JFHeCMRYXo+
         tbfjp3I/uaavR47PcTvCj4MynFCr2nVchebsyZo9L9mL5SsUtLKWFFgbWSzi/6MU/SA5
         W3nTB4m+2dF5DKR+o6KVMkQYQOVhKIgUEI1rMsJqDCQbWOtNJWduHiMwhF6BW5ePrP7c
         k7Df8mxXJxPpUGAHCpjIzHzPIAGnknBB4wHNEn6Q2CFJeHnugPz6+qYe60sUk6c3OpOO
         uzgw==
X-Forwarded-Encrypted: i=1; AJvYcCVTMYvV/xa2AS82tbrnHEuRw71eCoXTx5gJgeM3P88QzZ6LBNcySzEApQ/R88QGNTS9u0gwPzAS7QCsp14I6fA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgYeuLWr69JQgI14Hq3Gnul5ZKBQqCtmXFRpTyl4yQIcQhI9Oz
	OtSnXMdWw5myFp9V8tbXZnLbbNuZLnqDaklUV6If7AAnnn3qOQEfxEm5TY8OaQ==
X-Google-Smtp-Source: AGHT+IHBRIrLXFaaBv6UUOjhdIM7tK6tsQj3oOcxvxYkMmGaYVMHAjdBu/AmhHynbAxlaCZw2kdHoQ==
X-Received: by 2002:a17:90b:1b4a:b0:2e9:20d8:414c with SMTP id 98e67ed59e1d1-2e93e0139a2mr257317a91.5.1730323751676;
        Wed, 30 Oct 2024 14:29:11 -0700 (PDT)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e93daac455sm141073a91.19.2024.10.30.14.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 14:29:11 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: dmitry.baryshkov@linaro.org,
	jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Wed, 30 Oct 2024 14:28:35 -0700
Message-ID: <20241030142833.v2.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030212854.998318-1-abhishekpandit@chromium.org>
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mux configuration is often the final piece of mode entry and can be used
to determine whether a partner altmode is active. When mux configuration
is done, use the active port altmode's SVID to set the partner active
field for all partner alt modes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 53d93baa36a8..0c8db11bd8a4 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -618,6 +618,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
+	struct cros_typec_altmode_node *node, *n;
 	int ret;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
@@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	/* Iterate all partner alt-modes and set the active alternate mode. */
+	list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {
+		if (port->state.alt != NULL &&
+		    node->amode->svid == port->state.alt->svid) {
+			typec_altmode_update_active(node->amode, true);
+		} else {
+			typec_altmode_update_active(node->amode, false);
+		}
+	}
+
 mux_ack:
 	if (!typec->needs_mux_ack)
 		return ret;
-- 
2.47.0.163.g1226f6d8fa-goog

