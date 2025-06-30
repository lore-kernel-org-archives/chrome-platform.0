Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B728C2B2
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292776; cv=none; b=k8OsmbN9I1IXGbG11KcO4EVScwKQO4JsrdMzGumeHFf2d2fHhHB3M8JHJQ+GAHe8ClKZ7gKTBvAClLBMbxmHhlnC/elu0qx/nc1TpYFr2TPcaeURLqEZqBgnVfQrwR5MZ7uN9RQow4A5uh+fM7SJbogi0RkGicxjCgPEsYiz544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292776; c=relaxed/simple;
	bh=LNKB7M4XGZD1wvMm18MmkB/SXjyMDrkXYtnipJUgGD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzn10QiTy1bHbC4cheepXeA2HZYpJDTaFpnD/DgvzlFZD1YEZj6nvKnQy38SW5n9ev2Sovctc7YbAYLwZ2TLSeVLk4xK54LfMvz0unagT5P3UnkhexzeKTaLU8k09bpK4YN514pz8yWIXZaSzsQhxPGKB7yvVOGKJWhZhD/GiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pf4ICjwo; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pf4ICjwo"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso4380032a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292773; x=1751897573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KBYhaaZ6zyK1v99fMMJLyWKmWrudMkEEsbHwWdxmU4=;
        b=Pf4ICjwospurmyItUr3HioR9QL4S/6FQyC3pvmVbaMZk3U0bJw4tBoD1iwKxneaUcx
         P1vcB8Vy8poBnWloZd8beRUy4ocDswoVv+VUL13B8A+bMCzWRkg4/3vg+b8NJ/oH6Nik
         m5qICZM9TBZAFodZ0hmiDDxZ7yySLO3Nno9zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292773; x=1751897573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KBYhaaZ6zyK1v99fMMJLyWKmWrudMkEEsbHwWdxmU4=;
        b=Zzl60nDsLYa99JglCNo68gTKZdic6MLfS9ztRkcJ9vLDK0zYc0v+zg4qOakInbxtYx
         hjo3kB7eKbIW5SksSLd0M6dsncIWt77EvW+WbqMHFECZ+T/SfXVmZU8CiVMjHCiqrggu
         EVWgwOLL58h4VGd2cTfFcry5L/HbSIFs1gsOpZUZQC6jWUFymRXSkKSfFJ0TmwvRVr7Z
         U6bLusNxB6h6Z8/oiTWAo+PivlYT6lzd+EUcEASODHNh4LpLz07cpbag2DLg1ddiJgeA
         JVVJ/PxmrdA+yJvLZJ7LrrzfdEi5zuh/rqpApB1BdzOsJ75yKuAl+7M4t+SYZbEm37Zb
         3myw==
X-Forwarded-Encrypted: i=1; AJvYcCWH+NmTahw0sgVR6MSRIPldK1KewfyNFXeT+OZbncqhp1SIjyXQErSFKDb+NxHkVdtrXwreV1RMV0zTkf7eln8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHlTkfZpXyIvBJS+EeBsj7WDON7rVjJt6L6iIaQ7D+Wu9BsjJp
	50cJjuNexROhier3G1KYsTeX13Jh6jr0Ed7sySrRe1lRPt6yFPNKSgu9SskW5l65+g==
X-Gm-Gg: ASbGncvsRMEgzKdm3aoimwRCx/Q9NlKkVeMGVm/oPXrRYdXN+VdmQp0II3jX72wZ+CZ
	k40Z0Ii4JyC9o3rdmbTjKWgjuIYwQH+5ssREultavNQfdW5xFLrta1fa2ZSBIexPLTytNpyGc9D
	PwbEYOLrfiUl5QHQOmlvTuAy5bhR8D3CyXf1Ousy0jsAb40lM3doS5Q8t5cdwsaGgDcNQipB0NU
	x5lFBNpNs2A9HZGJkzskirMohPJL6vvaP9p1+uN/IGU7nXo+p0WSd50GlN3L+MGxR92wtfhh3t0
	p6twN5WlvPtdpmFrOG90qug62lYrOB/eOEnILMt7R3JTPEJlRbwKpM7zzlkNvC9Fxv7SalYLZ95
	YrN1GVNgswsDfpUGqmfYtLdakRCp2sRN8qjJuEH9fLK7tFdO9m3Dg
X-Google-Smtp-Source: AGHT+IHGJggqCDNtOOZaIaGa+EEv/ilhZRgs8ngdME1C5KWNG1YEyP/nwbdR5Tfg1rSmkUT0/Gm90g==
X-Received: by 2002:a17:907:2954:b0:ae0:ded9:7f31 with SMTP id a640c23a62f3a-ae34fd88f19mr862849766b.20.1751292772639;
        Mon, 30 Jun 2025 07:12:52 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:51 -0700 (PDT)
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
Subject: [PATCH v2 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 30 Jun 2025 14:12:31 +0000
Message-ID: <20250630141239.3174390-3-akuchynski@chromium.org>
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

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..3aed429fde03 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -408,6 +408,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.0.727.gbf7dc18ff4-goog

