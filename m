Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBB14EC7B
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717779815; cv=none; b=EzzJTj10PgoJmc+jm6uweLAGqJTxo87yMKOcq1+apSEZAbjFGAaamJBruQeVwUh1anBu4aEe9Hm3Ww9FIgFmONdSRxnmz95huxvpuVlglqbiFCu4ZwTnefamRYK1OElgBNGlU/wxmWjgyWQh3avjRPW1mGGlp1TdDJHLQrZdGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717779815; c=relaxed/simple;
	bh=i0v3Pgeq+IMesWEB6AQSP9LER2FNbxR1ZCqootTAEFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXVH8g+xaem6qtK7d33V5qS50MpWwisyiB1g9DWYQ9y5sSq+IvGH2ElpeG5m4o9Vm9XFktgHt0ma26O6x6XrUDF+DwyBlGfIIqqCpneYOUNOKfuw3/eTJjWDqRQfJkxyiUvGfb5k6TKxW94HZpJv4cVNHujv8l3BOqD9qFuSTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hc1vG3J3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hc1vG3J3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7041b6b7be0so345116b3a.1
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717779813; x=1718384613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPh1XG7OKPHXmVBg8lSEqInQF90UPXcUP7a+mw0fwSY=;
        b=hc1vG3J30dh7vBmDxgd3+T1ykAYYRYCUIxz2D1uyK5Yg9ppjVkC+6t+17gn/nC2f5g
         4QDKbKGmmsDQVxqkPLryms52U6BB7wpJ6mHRvbO/USEk6J+pvYrcDHsaVRvyqyftsEB3
         ipB3Wp/fagHAsnO8M22G2Ht/PvmhC3gu6RKOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717779813; x=1718384613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPh1XG7OKPHXmVBg8lSEqInQF90UPXcUP7a+mw0fwSY=;
        b=cbKoNVJyPfbou12B70GH3l5JEi6JlWG1ScJNkuw/YdAEuvM7PZ8Ztc4Vuu8dRzCC+h
         zLFvUDSFF0rmW+iMz5BltJgJVTn4vL3Lt4MXkrZC4coCtyNCfQFzKlA3AAftGXl3xzrX
         xKje+slHdJ7UcQ9ilNq20Z/ZAWSAdOQY9E36irMFRsPMrI5pUskONaDNWeiF9u6FPeLT
         5DpADOQJO6E5mIQ75B8O50kFPyBRN4YyNp1WYCSEdVc9f5JnIozMpRXuKdZNxF8albGA
         ybhfGmPSUt++/GGJ5Sjwwz3edpClVq+2WK3F1IvKlqwufE6nd70ca31w9PBTgaP2vfOY
         mt7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNBkpGC5pol4eeYUxYegO+oEj6B4DUJO4+lEeB7Qyr5IidkomuAGfnFgHfN+rpzgPibqtWj5Bw2a+KMEi1nUGdHpGY2dSpy7aJhrugeqj4
X-Gm-Message-State: AOJu0Yx8LEgL72D0RBCQ/ZQsGpnIR7bkrtitVDfzt9XtqsMg8kklh1tr
	1L82+IlLGgy8IA/2AZFu7uHtEaNGmtPoWbJXzlxhcVRQep/SGqhyoOduR2Xhkw==
X-Google-Smtp-Source: AGHT+IFtw46qtyb1UN3CGT1XSYzG6p20xOQSgcqCSxXmF+1ED1932FuZSayNwtcFsfXC08B84+z8rQ==
X-Received: by 2002:a05:6a00:18aa:b0:702:496d:d8b5 with SMTP id d2e1a72fcca58-703f8622841mr10847793b3a.6.1717779813394;
        Fri, 07 Jun 2024 10:03:33 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:98ef:4953:160:1c67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e439d12cf5sm970705a12.67.2024.06.07.10.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:03:32 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] Add cros-ec-keyboard v3.0
Date: Fri,  7 Jun 2024 10:02:55 -0700
Message-ID: <cover.1717779167.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
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

---
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

