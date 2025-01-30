Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1F2AE9A
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jan 2025 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201640; cv=none; b=kxnSlkStiKNZ7RhouN3K5Z3oDAeY7YUO7YLa1/IG8Cuz2p13UgguuB8Po0soc64uDNyQN29Zqi4E3LXTk34VYRDj7KcEL7OGiWDWlGTWu1E17loxvLGZ/uB1blP7agZAVqJewUvDbFGI2ZpNHqmO9/TipUMUnfy2AvJVbyARJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201640; c=relaxed/simple;
	bh=X/iSvOTB/wbKNXaxQSPONie+uYtlDEHuVl3r9XGxDM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gvfF8w2bBJ9v4P2zTYNxYFCqIUMFbyd3fF0Ng6Car5TnwpdSxDhqaeOXRIjNwc39giOj7oe/qLGhLrbrJpEHQwZbSoPAW1mZ9kEMjWn+JSZ4b4cISZerV9nsaBXMb5k+IN7Fogv4nZTII2+Etb956HPdqKyarMqZV+rnmIxNKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWxcCiTP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWxcCiTP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216728b1836so4165285ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jan 2025 17:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738201638; x=1738806438; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AcaB2qNtUW0VMQCKzd+TYyVTdsZuz2s/p6vcBSzGMs=;
        b=PWxcCiTPY7/emdq3toJwFWkLSFOo7PmKnJEaOriwMgd3wtFysZ26e7w4kTaxj9QD4J
         YUUdszgNFQgjHlUjwLTIOqXskGbYmmTSAv5d2EGzlcjS4Tjd0tL65kxfyOeWdSTZah4K
         DjWTbTkZFyWOrVdI8Cc594K8Cz78z6X+co7vPYW5ws4+jgWHlIwl2Qs0LjvdBTPij5HP
         himc8nkBnaJ8xDXLzGizQ93U8XMMUhaxj3ubDJrNlQVkLA+C1taIrwkB8hpc7T3xqd7t
         uuHj0SIHEdFlAgKbsJR9fD1dSCc3uMAqJvm7I0x673kM3HgY88s3fZSArLxwzpkXD3ux
         hZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201638; x=1738806438;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AcaB2qNtUW0VMQCKzd+TYyVTdsZuz2s/p6vcBSzGMs=;
        b=KCYNRd9ynfh+SZJ4n4/83QlAOAn219QG8ulK+fjisNvS3MiDQ/IomvO7slpIXjkXMh
         4FAGIuxAG5M+BM1k0gYNuqGl2Xp47Xb9Jj4rhVLUtXUiEPZaU6JXigyBJRFwZTYJz6VV
         6F6m8Q1skLRHA+vhBH1TNzqM0aVtRI/kWWVDnsxkdNs7qzKVv0Yryw/ixbBjezgR9c0/
         Ib3qlHuMbco5VU6Ivoz64wRcCCEE6gnZwfU5KMNUvCLpAI1C2IULQQk5FByWiR81+iCu
         FpNCh4Ys9nbxROjVUy8CvP4cYe4kSc/EP7nuoAF8VjwlwFsq3nhpMCIGA2tK07TnVzfq
         8kbw==
X-Gm-Message-State: AOJu0YyRQ5zM8aCn0pYKvsDCSMJ9tmq7yE/f9MYYtNFyKx/oOwP9tV+T
	0cEnsAi3HJBbC6L5bSiq7RuilBL1jJsyYn4ONHFu3UKbob3/cFx6KrjU3HgO2EuHmcZLh5ej79d
	T9A==
X-Gm-Gg: ASbGncuWwH+J5aY8ldBLTNO609ISx+CAt3R3YLlfMKQjQ4s869zf7DaqarE3bX+wu5s
	2QG75HGMZ3bsYNyLqGcL0Y0iikf0VFKEv+Q1et0f9NO44gJodwuiohKyvxUZ6XTECjhXdhnzPMZ
	ZKq46ITJON4Lu7bYmUaRl2eQUpt1E4MmVsqx6GIc4wj+5jyyZ/ks1HIb2Ft1svm4YN1ZVKukwZ1
	4X+oh/i4AEi3FUTycYtYY4CR4bnJ0b+OtIUCq70s2bu+jUxkhUttLsfOmz1xi5oWqEEJ2ByqcfT
	fkPVtbhNc/DuGhMMx+L63znbpvozkp/mhzwSrBZyISlPyWUrEPA=
X-Google-Smtp-Source: AGHT+IEsdePDFqR2DsAE0H82TGCtsTr+UgPg6bSto8fx7D9rKq+fJhl9BWxGuZJ4NtsnWXfcyxPCPg==
X-Received: by 2002:a17:903:124a:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21dd7c35654mr69208505ad.8.1738201637754;
        Wed, 29 Jan 2025 17:47:17 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee375sm2658565ad.24.2025.01.29.17.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:47:16 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Thu, 30 Jan 2025 01:47:12 +0000
From: Benson Leung <bleung@chromium.org>
To: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Cc: bleung@chromium.org, bleung@google.com, jthies@google.com,
	akuchynski@chromium.org, ukaszb@chromium.org, pmalani@chromium.org,
	abhishekpandit@chromium.org
Subject: [PATCH] MAINTAINERS: cros_ec_typec, cros_ec_ucsi, cros_usbpd_notify:
 Update maintainers
Message-ID: <Z5raIM_qhCF7oOB8@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Add a few new members of ChromeOS USB team for the USB Type-C related
drivers for ChromeOS: cros_ec_typec, cros_ec_ucsi, and cros_usbpd_notify.

 Łukasz Bartosik <ukaszb@chromium.org>
 Jameson Thies <jthies@google.com>
 Andrei Kuchynski <akuchynski@chromium.org>

Prashant has also moved to a different team, so by his request, remove him
from maintainers of these drivers too.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51e5f43c6354..c62d592a1910 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5481,16 +5481,19 @@ S:	Maintained
 F:	drivers/platform/chrome/cros_ec_uart.c
 
 CHROMEOS EC USB PD NOTIFY DRIVER
-M:	Prashant Malani <pmalani@chromium.org>
+M:	Łukasz Bartosik <ukaszb@chromium.org>
+M:	Andrei Kuchynski <akuchynski@chromium.org>
+M:	Jameson Thies <jthies@google.com>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_usbpd_notify.c
 F:	include/linux/platform_data/cros_usbpd_notify.h
 
 CHROMEOS EC USB TYPE-C DRIVER
-M:	Prashant Malani <pmalani@chromium.org>
 M:	Benson Leung <bleung@chromium.org>
 M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+M:	Jameson Thies <jthies@google.com>
+M:	Andrei Kuchynski <akuchynski@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_ec_typec.*
@@ -5513,6 +5516,8 @@ F:	drivers/watchdog/cros_ec_wdt.c
 CHROMEOS UCSI DRIVER
 M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
 M:	Łukasz Bartosik <ukaszb@chromium.org>
+M:	Jameson Thies <jthies@google.com>
+M:	Andrei Kuchynski <akuchynski@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
-- 
2.48.1.262.g85cc9f2d1e-goog
