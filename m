Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFD926B098
	for <chrome-platform@lists.linux.dev>; Wed, 31 Dec 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191744; cv=none; b=RlpaUyOA1Z5UYt0KCclK6osfdhtsib7KXEoxrf1E0PgQeSGMR8p27SWt0bR7OIA/U72oD8z3pFQ16vVHOAkE44TW4Of904RmeS+7BeTLmUux+0zqLiOclp4MN/TVC56g5i5sXAZOh9n3fN28Wo4CersmZpLGS9PTjvovbaLOOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191744; c=relaxed/simple;
	bh=AhVg3Ya4t8+09xhLV2MFKHi58VKUWxRFzPDeqNG4M/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FsFQU8wTRVZOfnZpzRoOnl5qc5MXMosk3hYyi8F0jz/mzpW2vn0SSOzp0figjINaDDbCJdwYbraTehM8s+rVDv9WUat9k7LeDfg1jtBwZ2fPZ8mOX2tyG941L9IXFNaxxQTAv88hgs3C+lvoorNsjUmKc7U7hDyY+UGdduZ8bkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eobu5WMX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eobu5WMX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so85726725e9.3
        for <chrome-platform@lists.linux.dev>; Wed, 31 Dec 2025 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767191741; x=1767796541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJt+Vk5CZtSda+Qv6TxKnOwmdavVEtubrUrFCi+hJhQ=;
        b=eobu5WMXTYTH30zT0tdarpJlgspVv7eZxoiN6lFTiECbNozDdGQmfvfJ+BD//H0N5p
         neTrXZ9ye79GmbZwa7XMTr81yQMpKgUmxM5APgs3ld3NZiaee8PrlnbOfv8XROOSTpaG
         6t7SrtG6A39h2NYDO54mKdvj7WsTSvrCY05d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191741; x=1767796541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJt+Vk5CZtSda+Qv6TxKnOwmdavVEtubrUrFCi+hJhQ=;
        b=mxn3Y6oTHeYEP1mqE8Gyp2IfyiRd8pi1+BpBqpxCJcH0I3R5ghXnQWeKvRH4YIu8rQ
         3eA7+ZpmFwKiv1C/uoJpyhZsvfWkTUs9rreXiT1+aYEGUXUfASs2RDVolivmXfrBCdAw
         uSKcRmP7XIceBSFZXoeBW+cxrB3hOJC0pkHVlBGj+35uj2OSPFQIkqP+ijHaXKvp+lht
         IgBlDaXXfEuDXCTRTkYMmFW8IKYyGRz0dE3kjLHb9pJJi4F8ElKTag3AJEpJwdabVbp5
         Q3HhM5ZVsBxMSTrg9ulcew/T+jz8jBkLa8GRKd1J0kOy8HzbXf2cTW8i1bOCr1RwyqCe
         SPSA==
X-Forwarded-Encrypted: i=1; AJvYcCXgh/13KtQmvICaxoP6UdLtFVwAvW61i9cys8RiH5fn5ljOY8NfQN7ICDx6RDSwinEiyHoeZC9t2ACwSF+DyOo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo4R2vM6RhsuGoCRGFTt2Tz42v0IoOA3BRBkFhGhDJQMb4L9W1
	C/vSKxrKsg3GewivMnpetAqFXJq2cpnu26fyINR5TXJU9xoWbKu7jmXTlJqIq9cigg==
X-Gm-Gg: AY/fxX4o6rPzG/xgkCq3fnngPQ4Q4e9/d0PufelZU3p1raIDihT+QrQ+pnHSiAQvNM/
	8GDg0W5TAe8BU6OTyHSrRfw0NROs4Zk3jVt7HSrIUgdTR5NdvkB0I6s/vgaUeRkzJjOXpYJ9Bb+
	BrqoGf8NQzuPHKeCOkscvyZYdNo/hKb9h88bpMa4txTxPW2dUaD7flQxEH5UKRIap4Al/u/whcE
	nGqbD+ksKsybv1VqOjGui8P3gEc7aP1elHBZ04VzSaSVYy1MzY6PXRzd0LxNE8pIDAI5yPbnu08
	oPPaoFVjtJalAeeZqygnlxKS/hESL/gPyQcv5OG6VEIDKOlRkM38DICXsxn5QN1YTdGUsv8vsHR
	9ujAt4DZyFFbrkaNAviI3s+mX7D2C9STr0+W5xxWtq4452RfFQn4dTUog/eu9dQA/S87m0poGVZ
	jmZRBI2AzNPWGXWjUVColV7A85Qw==
X-Google-Smtp-Source: AGHT+IEAuByjLQ/pUsJ9uqNDD9bJhs+aoCV8W8RpPLTDvlnGTrKTtFFsW+clPesgyA5XNjr0o/YF6A==
X-Received: by 2002:a05:600c:444b:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47d19549625mr389224705e9.5.1767191741123;
        Wed, 31 Dec 2025 06:35:41 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm630300935e9.13.2025.12.31.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:35:40 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Input: cros_ec_keyb: add function key support
Date: Wed, 31 Dec 2025 14:35:36 +0000
Message-ID: <20251231143538.37483-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, v3 of the cros-ec-keyb fn key support, just few tweaks from the
reviews.

Changes from v2:
  - renamed the dt property to use-fn-map, dropped the example
  - added few function comments
  - added a helper for obtaining the fn code
  - reordered, dt patch first

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one

Fabio Baltieri (2):
  dt-bindings: google,cros-ec-keyb: add has-fn-map prop
  Input: cros_ec_keyb - add function key support

 .../bindings/input/google,cros-ec-keyb.yaml   |   8 ++
 drivers/input/keyboard/cros_ec_keyb.c         | 136 +++++++++++++++---
 2 files changed, 128 insertions(+), 16 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog

