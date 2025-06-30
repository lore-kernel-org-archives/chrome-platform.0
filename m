Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1028BAA1
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292794; cv=none; b=nM+EMNXXrcVOFLrz9wjM7t17Ax1CxbW65ajX5hgRv948/EnXuytR38RVW1ZHYFjZuuaMcd6nNXyXi1ksySpAEfWh7YWCjGCCGaNFt+87X2ElgVyB6YpCp3IR8bfz7/AfDgQihkYZ0/JE6rb1lCQBYRZEJ7Nv5wjs/X4UPYE+SKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292794; c=relaxed/simple;
	bh=Vml+Vlmh/yNyrlNV0OMkYSZVPlVmBlgOUuBzWRBqzfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ6dbNBlikwI8y8LxEln90ObuyAmx94laBBCH7tvbPRznB8e3S3SXJQ/hJ5A3xCSfOcWO5t0dXIvCQCgPzfJlo++fs2wMLbEV6C+ZIa20ByHiX4lplYCBWJosnNh2vWQ0aLEXOfEWyN4A1fvpuJSXm0x0y7Nz40JIjXluNTk5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=moa1mq8k; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="moa1mq8k"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0e0271d82so768007566b.3
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292791; x=1751897591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8NRsPP90vS0j3nzCWJKBndtcs4Ube9as2Ue2hWIhFU=;
        b=moa1mq8kpGHOMS/wdhIGyBVBJ6wRUy6QBHjODWXBpfRobTXSo+ICAk10nELgPFDUK7
         8uupVf0iMP/UpaBOFkL8igY0rVnthbXt8TQpOKGudKhWkNGwGgFmHoo/H1nvmr7RWYOT
         UmGQAWLvFJtlxwckkRm40excoeHOfzcb5w5Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292791; x=1751897591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8NRsPP90vS0j3nzCWJKBndtcs4Ube9as2Ue2hWIhFU=;
        b=UNZR6yYllQcr/j2+S20keCz5OS2HwE0eflvyOHd75zd9hrS8oMcYkW84JgAHZsJs2z
         QiMzX71xC86WLHcs+Xud3LmT7nggXwoF5TjFyST6M0x4hwoG+UlWBwt5gx7RdSMPGi9z
         vYMq8+FYKoWWW0aQ9KLt5j9kIhEisJ39DxFOmw1PfyETW+3pO8EXlfbUt8Qp1KQ937zD
         GqSWseq2cGPoHPQTO9B7XtjKLcg7zXr0+uPR8FX2GJ9WVjIusXwILicPiXhuLxiEXpcX
         h7vgsI6YpMfLXbEm1Ze2smNR6P+DI+VBHFbyYQC0SBjMRTdQHMx0rfV+GMOr6hMAax/w
         PCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHbAEHnlHbIq5hScqTGwBc7Z/GE+aZ5o/QiQAAVBqFVm99lTqcL7yeoUfRVf2A/eaTCQAZnDjiWNEy0y2KsGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzA9rjhws+pC5QUdYSRkaEdaIo3DpeLy3dCtfo14H13CJJ8dRQU
	ncRWcUJPrcjJr07fbyy6wB1RJKnv5WoNjsrgiihgD/5e75x/00m2H9ubudGTTBOYMg==
X-Gm-Gg: ASbGnctlm+7+yY77pB092lgXMemUpM6ilfr5Vf6uqYLqV9IGlLFWEBR1ZPFhDXR/DHK
	6U0uBe4Rb6BcIp27D1EA4vpglXtbDnkZTYF4k8ZtuTxVJQr4U0hPeSThBuzkQLvdC+CTHMFkFfI
	AI/D06LU9Z1aEOxzt2ad6WfXvsIo1yTlwzPcBKs/vdFHxWIQYgz+MHNBiMnQnsoiA2OhLLXsZjM
	BY53dAhXt0iiMsePHJ7yeyXkl4gXYxdXgXnBOtk2fvk+nZCho4g7G9Z1sWCpnQkLmYnv8kx/x69
	l2N6h1gMKf2pBVAzNm2zRhqZA+ct36cqj0sFF7+MgLPTk86rCQNpkXE+REEBbsTadu5YOb3p9E7
	1s0Vh60JzsIejgcG9UFJWGKNUcyDX5lsvBgX64h6FkNbMYZLUXDIw
X-Google-Smtp-Source: AGHT+IE29gt8xWBI8pZXeQthKWA11FWxnfDchrHgHB2UzYqRmz/TTQgJ95KCGJWKBD6ofw4Dv8EGrQ==
X-Received: by 2002:a17:907:720f:b0:ae0:c6fa:ef45 with SMTP id a640c23a62f3a-ae35011ed14mr1314176166b.41.1751292791326;
        Mon, 30 Jun 2025 07:13:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:10 -0700 (PDT)
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
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 10/10] platform/chrome: cros_ec_typec: Add default_usb_mode_set support
Date: Mon, 30 Jun 2025 14:12:39 +0000
Message-ID: <20250630141239.3174390-11-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cros_ec_typec` driver currently doesn't directly consume a default
USB mode value. This commit adds the `default_usb_mode_set` function,
enabling the `usb_capability` sysfs attribute to be writable.
This functionality allows users to dynamically activate or deactivate
USB4 mode on a given port.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c5a7f42ffb5a..3de6b819906e 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -44,6 +44,11 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_default_usb_mode_set(struct typec_port *port, enum usb_mode mode)
+{
+	return 0;
+}
+
 static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
 {
 	struct cros_typec_port *port = typec_get_drvdata(tc_port);
@@ -59,6 +64,7 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 }
 
 static const struct typec_operations cros_typec_usb_mode_ops = {
+	.default_usb_mode_set = cros_typec_default_usb_mode_set,
 	.enter_usb_mode = cros_typec_enter_usb_mode
 };
 
-- 
2.50.0.727.gbf7dc18ff4-goog

