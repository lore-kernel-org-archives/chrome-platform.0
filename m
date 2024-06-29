Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A707B85938
	for <chrome-platform@lists.linux.dev>; Sat, 29 Jun 2024 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719691915; cv=none; b=sMzVpn1RRU9P/sP6G1KlCgqUJZfoYJVGoCixYNkgTghnxPAdUN/GKo2k89OrL/Zn5ReSjiYBXiZHGUSD3PjqzGlBY0udCjd7EVNkeviYemO9mQ2Zi/nbscDsMhgAYM95ZrFBJrxWQ95WzSzrYAjz3SnHZbSpFou+/bOVb51MRZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719691915; c=relaxed/simple;
	bh=u9U4agHQZz3arjZWc8+RAjrm4Zn3fIFdm40yJ0V+gEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AehBct0Bugnhfskdo8zgAUMLUOBsCJXSxI86b0nt8mhifxj5RIhr8Bu9IheSeZp5v/IXcD0MWt/gRvA9kgyJfsYOkBlO3PjpdyFZNZOVggWo0wudNjBUjJ1b8hu4ceRnO0z3/t4XdF8REUTY0WwucWtEv/wKf5CNTyQ0LtbVBmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WTqR97El; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WTqR97El"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b9776123a3so713740eaf.0
        for <chrome-platform@lists.linux.dev>; Sat, 29 Jun 2024 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719691912; x=1720296712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdgbjN/cTZJIT1mYXthvN3kyWcUGS/sAJ/m/sKyDdu0=;
        b=WTqR97ElkyGQZ/Bi4gFdGdyY6gRg5SH50Le1iKthDt7gsEi02cH1UHRcNQDMvSc2nC
         aliBv21RijsmMZd7XGWl4UXhcDwjnHV/R8dBEJT1y6Mn1ixL/y6LH+B9D9qR99E9E4sT
         izOM31nys5u3hVJfVXOab97a6B+nw3vd4tUXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719691912; x=1720296712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdgbjN/cTZJIT1mYXthvN3kyWcUGS/sAJ/m/sKyDdu0=;
        b=LoQS5UzryRE4WwH5xYD5AU+2LZBCDkU0E6iBuTMOoUeFairPFGvgBMF5YBaUhmfSxf
         UESFmQZeLUbon5HUvfuwLkXoBbmBRp4sxe5UMp6uvyVeuv+wXAw+X8DnBrJYyUyxv0Hd
         3R1vnq+FpmuqcHzkl/bRCf8IL/Wu2iT7LMJ21CeyvfDCaEHO49n+s0dx8OC+a06aIL/Q
         stOmE+3IMH9NBWBsENV9BVHyhBN+D1xIEOSIpBxaO5T3+N3UGu60CyGa8L1wcbz6CdrG
         2cJ27bQLlkB7b+WY0qR2IvevG9LKGmCSypwOLcbOXLMG/tc3hX0knZaEbyKUYYB8ghpZ
         RO9g==
X-Forwarded-Encrypted: i=1; AJvYcCXHeKpBieLF7FhwdQG4bqsrL43g/4s120LcM3xBXyqxPbnsqfotyQ0gopnnA4P0Y+2EXyiu6kCFMPXTlp4I4wfDkzVHBXsWnjySisD4++EC
X-Gm-Message-State: AOJu0Yx+VjEtZvcqikpsZYgBAZi0nd4rMmR9dVfUA1Ha8peQVxVjj0NK
	Cf5c2wXG/JaTgU2qE7rW6nHL7AiV7wo/T+xtUxyynm3cUXJXyE1VqY4olJHE7Q==
X-Google-Smtp-Source: AGHT+IE4/DvMGIOavH9gdBcHblnF3ArmID6l3D9wIO4XmA6a6lYa/7qYXZO7zaibUCKcBvTBtvBF2g==
X-Received: by 2002:a05:6358:b10e:b0:19b:5c37:3616 with SMTP id e5c5f4694b2df-1a6acc7e15bmr157191555d.13.1719691911692;
        Sat, 29 Jun 2024 13:11:51 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:db78:5dbf:8bdd:601d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce43460sm3750412a91.20.2024.06.29.13.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 13:11:51 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Reka Norman <rekanorman@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 0/2] Consolidate ec_response_get_next_event
Date: Sat, 29 Jun 2024 13:11:29 -0700
Message-ID: <cover.1719691604.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Changes in v6:
 - Fix cros_ec_proto_test.c.

Changes in v5:
 - Merged changes in cros_ec_commands.h and cros_ec_proto.c

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
Daisuke Nojiri (2):
  cros_ec_proto: Consolidate ec_response_get_next_event
  dt-bindings: cros-ec-keyboard: Add keyboard matrix v3.0

 drivers/platform/chrome/cros_ec_proto.c       |  16 +--
 drivers/platform/chrome/cros_ec_proto_test.c  |  28 ++---
 include/dt-bindings/input/cros-ec-keyboard.h  | 104 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  34 +-----
 include/linux/platform_data/cros_ec_proto.h   |   2 +-
 5 files changed, 128 insertions(+), 56 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog

