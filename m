Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE55146590
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jan 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736886090; cv=none; b=CzLFl1k5GZCpS1cHTz2oOtIgJfipxfhQkIjpGlwlkVHKJY8Khp+mrMabxHsOFGuQhXZjVaiia6xL5IOFUIpIHeTvcSpFt+tkYIRiegK3pSsCfDbE4e1pFUxWpROa6OhV5U8L4Ugqg5B/bTtH9TkSPx6bVrKoCAl77TvcC9c4G2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736886090; c=relaxed/simple;
	bh=6LsiRLmf3vJ0QZ2B9ZXfWvVrviaE72Q1LBWtTb4zU/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LavkhL4ylQcxG25E37iLB7Mj5ftAXhBuBUReyvRpKHQZ3JdULglfyW/lMGBAjmveB0gAeCZJKMWr26Vbs5mhXVNa1jyhtfXXJSve32mX+xOkPYp9EVy00AdW6eGOxc63/9z9yN47x5lKDUeCAfeoogkmbyKoTGOhNRrXxB77u3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d74WA0w7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d74WA0w7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2167141dfa1so2664695ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 14 Jan 2025 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736886087; x=1737490887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RDXYZ6iA4Cx28zWNpxRn61oUA+7R9bbWsjGNe2+aB0=;
        b=d74WA0w71jj6GDYpe2MOPKAMbYAG6ELV+or8F7F3s5e10vIiztzHTTKMiQ3kC7U+l/
         AzkJ8it/OTwwa8wKflE6jLhkhqTQdzH0dOmJusNq9OEgpR42V6giusbgzJCiH56r9cjO
         v2G/DQx9o4fwZU7FuSmRqZtKDN4Jn+r7qVMCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736886087; x=1737490887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RDXYZ6iA4Cx28zWNpxRn61oUA+7R9bbWsjGNe2+aB0=;
        b=eVR+5xYOT00gH8+AtK34mcvrr4tMOrSF7crM1emhgTwFK0QaDn68FXy7ebbOePXdrr
         69+CPKHW3UToRFRWJHdOTt32tEQHIghY/r8kI2Vg9z5sCGH3in2TV/mgZhGKiFC9paWM
         rOqT3pJL1zOSZOeoXQHQs6Vt9EXGw+GeMkMSFJkNEWV9134vqSPgGQe41e7+uU7g7KOu
         5jmeROwq2u61EYdqxSUKruRsUQmH2lktDD8eXUuZ9AREJfwY/q5C4iA7kT1rPZ2be+07
         w2Fgv48e6uGsAeXWqD9N1JjMP6qodsq3w0XVD3qx6wjk9OVJGs26ILcEEE66Q1Sv+pWq
         XqrA==
X-Gm-Message-State: AOJu0YzNwaxuv67mMzJ4IqjEUkOudhHlhSQrOufLyQTdNOzb+2OmiMq1
	qHamF+4snOAUryaXfu/RPCLUINfyubgP+jc3NJWonCeNebDysZ5FZcf0yu9LkA==
X-Gm-Gg: ASbGncswkkYp4R3OjJb4l0Fw0qm3tJLzCPXlP9B4ajTtRKphcsnSMhdJ06MXbM2PZob
	Sorf/5hYdUHhIv9gtxHEOH5nAtQV8dQRp1a3BI9OUGHfwcA58qRJcJLXwkVgdjQK+f6NoHoAwtr
	80uB/wRKZanWdqQASyAD9A9slpYme5No9kN0hdxS1HLe8Bm05/PFHFaGkSeNFpvxmF8uFiuE9zq
	AbHwNKWbMh/kC+Li046ZvvXwud0PHmxF4pzQqSR2wgViiN7yw==
X-Google-Smtp-Source: AGHT+IGcdfgOHbotcXIAOAcDh37ufsFMFqqSLn1l6B8SLaRnPnoXBBUKMKTObyCH9KXhUMMeJF0r9w==
X-Received: by 2002:a17:903:1d2:b0:21a:7e04:7021 with SMTP id d9443c01a7336-21bf0d1c68dmr4761365ad.24.1736886086695;
        Tue, 14 Jan 2025 12:21:26 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:8099:8137:eb8c:82f4])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f10df57sm70732625ad.12.2025.01.14.12.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 12:21:26 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_lpc: Handle EC without CRS section
Date: Tue, 14 Jan 2025 12:21:22 -0800
Message-ID: <20250114202122.2352277-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix logic to support GOOG0004 device without CRS section.
Instead of failing, assume there are not memory mapped EC registers.

Fixes: be4fccb5e1fb ("platform/chrome: cros_ec_lpc: Support direct EC register memory access")

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 288ef9198bb0a..a878758b9211c 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -562,11 +562,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		 */
 		status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
 					     cros_ec_lpc_resources, ec_lpc);
-		if (ACPI_FAILURE(status)) {
-			dev_err(dev, "failed to get resources\n");
-			return -ENODEV;
-		}
-		if (ec_lpc->mem32.address_length) {
+		if (ACPI_SUCCESS(status) && ec_lpc->mem32.address_length) {
 			ec_lpc->base = devm_ioremap(dev,
 						    ec_lpc->mem32.address,
 						    ec_lpc->mem32.address_length);
-- 
2.48.0.rc2.279.g1de40edade-goog

