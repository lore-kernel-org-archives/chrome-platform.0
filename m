Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557822046A3
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jan 2025 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460420; cv=none; b=IgB1OsLz6AvLtzQMOq3Pzaoads856nPGFJdzqhfiJXCroymvHSdyVokcdkciCgAAYaGhcMhSgM+7dXbaQ2gqVWKpRFrEStM7eXD+WiPfMprX/dzDaFJpK7j5f2IKFAOXqGqtn9cL1yw0VY+ABdfPit832FdsZHirmrikpalA204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460420; c=relaxed/simple;
	bh=6z84NXznKiE1NpRqFZDZSeRqLTK2pAiyrFfu5gZG7/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X5dQKCaLvMAj5gsp5+NQurxg+D/q6bGc817JNcr2GMmz4Ot4UwCWKt9BweEdA7o0BnB+ScuOqm4Pzf/J+yWOJnr2e20K/UHT+poAWbqyVl/1IkzWSLCkbWQphm3zqo9foNX/fwabwSg0++Vg6/qGeL67lPYnblu4uKklgpgDjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fo1Ho9FC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fo1Ho9FC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb94cceso17377885ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jan 2025 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736460418; x=1737065218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tXgQ4cb0sIkfCID//2h8RdPOUcbcJV/Yvr7tKk7nQ8=;
        b=fo1Ho9FCW+1dNTnis3XfYNl31vcu4cO+zBONAcAImWqqIV879RhEDGPlaWrfkXUjd/
         iQPR/JUhBbW/qhGkJWVPvQooZTcGJlSpS51eY7k+mKJJD1yNJ8+eL96N6SFqZ23z3KNh
         lVmnt8YigB6vEy+IL3YMBwqRnSOnqw7q6Fuk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460418; x=1737065218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tXgQ4cb0sIkfCID//2h8RdPOUcbcJV/Yvr7tKk7nQ8=;
        b=Hvbom7ggxbfzKZoQEPpdqqnifRn7vrTK5/Ry8UWxu70WgSb5GWV3Pskadttnv62Jk2
         mbpRZCAkctWv/YkIjsz0uMh480d8vKU5V7NWr/67882V7A3DunMZhNLLzXN26nwGhFEQ
         d+5BVX8ZQ8ztV4UpDexLjuynysQTbcQH6KYKTOGli0eCK7eXmr1OI/34XEi03QEKQ2li
         cgIfTHbQwPm2KKeGD9XJhUDscRtYy3lbvdXFY2ZwI8G9MbRMsIBGV1q8t3CUiR2iO4rq
         9eCYYr+FkZkvWJJxCKD/M7ryF346a+8JhknWzUCOJwy+sYrb5sW14ivLXfUW/E1jfwuC
         c29A==
X-Forwarded-Encrypted: i=1; AJvYcCUz4uVANNK8dgNfHB89072TInfRNkAHlLBoWTGgTFF8N+s5b489lWCHVEmle/cy6eeE7frV7h3jUNDqHG/Fzkw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9HFIpM79UB4UyeA4m8bj4/5QgjAPjErPbsT3KZdNtHEwq8C4+
	akCFY5TtKcYRKSjRx6ZIfcHl1GrZAktNxyeC0PhoIuLyo1VGohwaIgJypg8xOw==
X-Gm-Gg: ASbGncuLQLW6mMGexsMWwWI29SpEgTHhIjZGq9X9xVt5DjkTKyB4+rMcQVCFa/Ggh5F
	DLmz6lv4fC6kz9mmoQaUMPiGwZnY2Si4xukgz4WVENYKtuJwkRTESycKJHrwZlxuIBiwTJN75Ls
	XLo42Fn7VgBrR34e48ZnQPVwlTw4K0hmBjj5R6gpQEWVnlpR35W5Kl0EkzJRMm6YhexnnARmkE7
	gNTRllgyPMTz1OpzMUTLsi1BGykTueqi2yD9i3l49upT+vfTqUpfrYck95bD8+oxk7bY2ZipoQf
	uTNAcgq+4UUSSgECPcbP
X-Google-Smtp-Source: AGHT+IFbGsLInk2MTDokl6bXci0oi0ScYGAl8eACwvZ0JgMc+OuCQNESJJhMTrboOSbjH+j4yrWz/w==
X-Received: by 2002:a05:6a21:329d:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1e88d043d3amr12319701637.27.1736460417708;
        Thu, 09 Jan 2025 14:06:57 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d4067e5d8sm277650b3a.122.2025.01.09.14.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 14:06:57 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH 0/2] usb: typec: cros-ec-ucsi: A couple small cleanups
Date: Thu,  9 Jan 2025 14:06:51 -0800
Message-ID: <20250109220655.1677506-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple small cleanups to the cros-ec-ucsi driver that was recently
introduced. Patches on top of next-20250109.

Stephen Boyd (2):
  usb: typec: cros-ec-ucsi: Add newlines to printk messages
  usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const

 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 30 ++++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)


base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
-- 
https://chromeos.dev

