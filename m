Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463EF28FFE6
	for <chrome-platform@lists.linux.dev>; Wed, 23 Jul 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279908; cv=none; b=RGWxjcgrOzso8lFvGYkpGXrg9E5UzaY6Ak49sCvWhC8eGdFG6U/8USwnd+OKJnIHe5OYTNbefGFte4tuvoCOcYS/Bs3XvnlNwZCb4SkK4mXp4viIjY6lg2l8Bp56YpN9pf8VVM0OuYIRcJo3yUZwZMlEZ3POUPeC2mmIJ0m0/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279908; c=relaxed/simple;
	bh=6zSWr6nH/KGpvlv/KyV5DDiEaTv3e7Cpp0KzZuxdtA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1XY+1sf3v/2GOs4XxztwgD5eIk5G5bS8PVEPXL7KIylkY0YFUYiG8GjHy8b3mpJ77F4MkJS9QnJmeEFVVJL+nym9p1C5KogyFal8phCEUtfe/errOTPQY7npDCvnszG2q7VdwMfV+13Di88VTRp+xcJEjzMklYYj/fER3Vx47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXOiWhc7; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXOiWhc7"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab53fce526so94134211cf.2
        for <chrome-platform@lists.linux.dev>; Wed, 23 Jul 2025 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753279906; x=1753884706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFy9TZzkAGxuZgNCwthN1QHzgVNATGxt3CHElfWCOUE=;
        b=lXOiWhc7Vn+djUqnES8wSdlnW8nJdQK2QVljOn0Hitk2as0MraIV9hVPE1sgcieyFx
         zMQ7JxJhQGL42oFLGoQsa2bS9f6CnHkx0/5XzWe4vGdFF/yDdBy2VEt/DXY/gGfLzkUa
         Lyn2gGYqR8TttM9v2/2Y6hiK00J+H+ywUMZaSCTICWT9LA4zXb1Dl53ssj/g/DeSStl9
         nDH9C8bLu9hhV/fzsYtPp2VvbIaDO6A6TeeBaeNmD8hoSbJ2S6lU/QlddbsruBlHoHiL
         yveGGg14vIG8OqBxZynwui8aGASwgPuKO7V5oFsUCXIol0+xc7iomhjCGgf4+BBH9S3I
         KbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279906; x=1753884706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFy9TZzkAGxuZgNCwthN1QHzgVNATGxt3CHElfWCOUE=;
        b=PupMHDXsNvwjSw69VvmwJeF+EEOt+2Ro84FtWimjTPHvHz1cacylhZf43697tKuZG0
         gbBC2A5+xmyn1PVHSoKWdscg4VDVw7aOcGLe+nkmWC+K4yrf6euCMpyUbs/JL8AmyqDO
         Lm+sJNjSlJI7Z4uk3nViBKtMD/cJl907jSMzy1VNPCQi+FSMN+TZmrXB9ojEoK2l55t7
         9vkld5VufTjt3FVgedsI4mDXuCPvSyxyAr/SGJpWSV/DR57sKQIUi7m9lGDfNhuotjpA
         KT92JZE6ChMGiMea7UnN+AGoDUbGr5y8n0rnJaibpIVaV9mS9ScjTtDQ/gq5vdXNc1u8
         gemw==
X-Forwarded-Encrypted: i=1; AJvYcCUnK7+9YtZOxHXQY6MkYi6YSwiHbsM+iHQ2W6Ep9An57JX+Ml9iPmUUNqWK04qBLcIOp8GxOc5lyNYa6nVNgnM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMHOgCZkm2djOC0XetQ5xU19JeP/GkAvPuB46wNmVPDlg6sTws
	reZlbROGMcZqazHH4EEowREjM17UD5vx64bA55fUeyI7s6nYR93Gz8R2
X-Gm-Gg: ASbGncsmUj3SPMF2IQbvbyjEzMvpVbrTtGSTyf+o1WWz5dqEMjaHU4LAdAEeThPdI7f
	LhHokWdvkCRpM5rG8IqdqXvrSK/H90nzYoXu70b8nceiCzTdtQRuXBLWuodwxclVr0cu211ouEh
	bJfXSDexPUUJYcOiAVodib5bST76tmjwGycKqDFuu9TCGXKxzjcDhbzCNczAa6suhVjjEt/r5cR
	erC+ep3WFNUCuW00hOM12g9zg6dgGpoGfG3JJPj+oZYKhu7u4JUpdazbYMVtvLPPuem9QeR0wtE
	Av37wJOwuPI7e/h6WzAbvc07PQzVFS49Bsb1Aq6Uw2kATCs3J+N7eEmxvxU8/29UgBPJom6A9DG
	6gBeaP/SMQw5y/g4QeU+cCLBFaO430S1BxjENE8Iy
X-Google-Smtp-Source: AGHT+IH43W6bPGs5N5EcarTgPDlTfCfxXYfTnuSltQofOhU7BqbBDkn0CR01Qt4bG9w0XwkLq6fLGA==
X-Received: by 2002:ac8:5948:0:b0:4ab:7358:1490 with SMTP id d75a77b69052e-4ae6dfd2d70mr42332001cf.51.1753279905366;
        Wed, 23 Jul 2025 07:11:45 -0700 (PDT)
Received: from localhost.localdomain ([142.126.85.247])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b204cdsm67352861cf.56.2025.07.23.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:11:45 -0700 (PDT)
From: Keenan Salandy <keenansalandy@gmail.com>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Keenan Salandy <keenansalandy@gmail.com>
Subject: [PATCH] platform/chrome: Fix typo in CROS_USBPD_NOTIFY help text
Date: Wed, 23 Jul 2025 10:09:30 -0400
Message-ID: <20250723140930.1443-1-keenansalandy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling "platorms" to "platforms" in the help text
for the CROS_USBPD_NOTIFY Kconfig option.

Signed-off-by: Keenan Salandy <keenansalandy@gmail.com>
---
 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 10941ac37305..2281d6dacc9b 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -286,7 +286,7 @@ config CROS_USBPD_NOTIFY
 	default MFD_CROS_EC_DEV
 	help
 	  If you say Y here, you get support for Type-C PD event notifications
-	  from the ChromeOS EC. On ACPI platorms this driver will bind to the
+	  from the ChromeOS EC. On ACPI platforms this driver will bind to the
 	  GOOG0003 ACPI device, and on platforms which don't have this device it
 	  will get initialized on ECs which support the feature
 	  EC_FEATURE_USB_PD.
-- 
2.49.0

