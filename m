Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C981991B0
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695659; cv=none; b=KcNC/uj1L8PCII7Z9cBCJbI/B2bxIFd1kBkeFxZRPDd43ebjw8IfeaHDimGX6sO8NldH7dUjsdivHTbQGkU/075tmRbcchw37FvVlPeU71AfhVCXLMRYj0pbpzQcbtKFqZmyohojnxbUHs9xJdtrlvnVnL163ArvOEYnkfsJHi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695659; c=relaxed/simple;
	bh=vPMN4+EuzAzMrkCd7/l/7R4dqNlDszNDo/wobQVjlgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DY3G3UUuUoWruPBsMaK3+OEl92qu+gDO3L2ZVc6WZzfdVWJOpe6CGOnlVbArYiRpdTHQP51hOq0TEHIXEPplqQ94jRvbEfgdKUtabPO5cDume59UnEGjEziY6WuXHGFjS3wD70mODHUMapPjQtPViKl+e5oPvHJBxHX6lOlPedU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCdcCbcm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCdcCbcm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f67fa9cd73so17472215ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717695657; x=1718300457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=786yOwwqWC8f8WKdqMq1eZssf/oeUFi1VZZ4ZRDSieg=;
        b=JCdcCbcmWzcY52T5aOIoKaCUKxag983nnl2RHHd2xL07JWvls7qBu1fL9+mYqr4CJf
         VjDpKeTm+RBmMGA2QtG3bCkyqd/LtkdVHvrdHjlhgpncjcdXjydbjNbJsUxPX2NKghFU
         llTxw/v7XBRZMM8jJiX5s5KDiWBKsKo7MOGmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717695657; x=1718300457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=786yOwwqWC8f8WKdqMq1eZssf/oeUFi1VZZ4ZRDSieg=;
        b=qulvODXUfoHuGxPr95Pg6ECoJZKR+0EXMwmykHzB9qDFBVr/xH7ylcBQnlcXkXziPE
         zTcJXBaxDEHaJM1DP0e8Wdjkv+KaIwbP87B3g89q8MHSmheUQimBfTJFQfE+eHYzIEX2
         AqXiv4dJQaxG01qiy8Wt86I+Kgaz6ynBuEBgGOEnKxgJOx9FiLNsTJRhK6KARuLsqOJk
         b05xkHTzISOXmkGkVDtn7Z/IRIvCDw2Fws5Pf6mmXbVhEVP66I9tI95zb8ivNgjLq7OW
         bHuJ2h9e2MQ52Af6t8mHWT2kbIPZ9lNGBj9qr/rGdV7wqaQlsv2fJGgKcbKYqhvPqZif
         649A==
X-Forwarded-Encrypted: i=1; AJvYcCXs+W3bONYDzQ25VDgYF82/EebDf1LM+P7MpBt6lT/0O9hHByqGb18x9zX68VmX3on2y4H44L2OHjNKj+xv8pJAcqXlmmndehG+4SiuL86g
X-Gm-Message-State: AOJu0YwNLXBqdFuI+zRL2ds2G2VQq81sDrdMCP+ZW37eIFRyF/GlebU/
	FxCB/g/NHPp6yQwI+YiBDj0s+4LUXZSRuwMJ1rCZn0pXciKWmcsWhr4mkfqIkQ==
X-Google-Smtp-Source: AGHT+IFnCZ/+uAkMhQhcfFVpNxKI1wIEiKMNJnnfuVBXtku06HzN8UdFZeDTkBwQBfpqdm24q50dNA==
X-Received: by 2002:a17:903:2286:b0:1f6:a572:86ab with SMTP id d9443c01a7336-1f6d0151b7amr5291325ad.15.1717695656830;
        Thu, 06 Jun 2024 10:40:56 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:3fe9:f321:712c:442f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7fd937sm17776515ad.285.2024.06.06.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 10:40:56 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bleung@chromium.org,
	groeck@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pmalani@chromium.org,
	swboyd@chromium.org,
	hverkuil-cisco@xs4all.nl,
	rekanorman@chromium.org,
	abhishekpandit@google.com,
	pholla@chromium.org,
	chingkang@chromium.org,
	lma@chromium.org,
	Daisuke Nojiri <dnojiri@chromium.org>
Subject: [PATCH 0/3 v4] Add cros-ec-keyboard v3.0
Date: Thu,  6 Jun 2024 10:40:39 -0700
Message-ID: <20240606174052.245034-1-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240604005354.2294468-1-dnojiri@chromium.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds a support for cros-ec-keyboard v3.0, which uses a
reorganized and larger keyboard matrix thus also requires a protocol update.

---
Changes in v4:
 - Change subject line: ARM:... to dt-bindings:...
 - Add description about keyboard matrix v3.0.
 - Add cover letter.

---
Changes in v3:
 - Remove CROS_KBD_V30 in Kconfig and macros conditionally set in
   cros-ec-keyboard.dtsi.

---
Changes in v2:
 - Separate cros_ec_commands.h from cros_ec_proto.{c.h}.
 - Remove Change-Id, TEST=, BUG= lines.

Daisuke Nojiri (3):
  platform/chrome: Add struct ec_response_get_next_event_v3
  platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
  dt-bindings: cros-ec-keyboard: Add keyboard matrix v3.0

 drivers/platform/chrome/cros_ec_proto.c       |  27 +++--
 include/dt-bindings/input/cros-ec-keyboard.h  | 104 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  34 ++++++
 include/linux/platform_data/cros_ec_proto.h   |   2 +-
 4 files changed, 157 insertions(+), 10 deletions(-)

-- 
2.45.2.505.gda0bf45e8d-goog

