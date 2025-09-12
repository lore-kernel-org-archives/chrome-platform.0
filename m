Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E628CF50
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659680; cv=none; b=HQtMy8qQ5UD8SxAM4RKzXmPgdMlbRAfypzDQCXdJWa008JGFLkUO8Yxwhok/kZj7urHzFWwWQm58wcTTmqpNrAP4feYCOt/FbhVpou2rOgbrJdJUEMA+gfvmC2w8I9c9PTbsuXQFUNrBFMShv3L4f59Q8f4XMa5Lf8z8jV8WRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659680; c=relaxed/simple;
	bh=LV7vwXyBrLIZBgstDxs5zq4DLuMoG96MyweJz0IMeMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvWJoao3C4wGmu6SGGOGBwP/R2Pbiq1K5vBU8NaaIElIXjieS1pUOBwWu9IMcy4o1U8XjQaOhjHPdoOZZeFmpEHlZhqL1St/JDh5wjLhsny/aKVEBMS9QIytvJrk0kZNZZrnaIHDtIpyw2iT75KJpq1eUodDV31WktqXbqKWu7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MEsK1s01; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MEsK1s01"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61d3d622a2bso3900168a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 23:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659677; x=1758264477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TG8DSB2/f+S8lGYTIHFJItZooYK8UItQSp8Clzf2WH8=;
        b=MEsK1s01O+bm5ZtXxtTIop9yudoP77YkCNMMAwdPTEiH24LrQgcw2J7AvlCdbCmY+e
         NsEl5M69vhWA9vQfIMebMAAPbzmIyCYLtstoz6f1naAQjzkbEEoUgInwGUKJevZHpY3D
         4pn+CarHVLWdgHFC7A5eAoCn2tZJ05ffYqQTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659677; x=1758264477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG8DSB2/f+S8lGYTIHFJItZooYK8UItQSp8Clzf2WH8=;
        b=aUeshpsPkNGdJ3znCh06KBoSvA24umw6O6z8rC5cLudrywTM79mhWTf9l4Etuoaxcz
         VqwcA/tAlmoU4Ky3e2mjoSDZ15xKHYdii+OM9Bqb2MfKxEScfA+gaCxtVsar24T9JTKF
         j/fK2AOw//vAtcnJH8c2T8wp1KJu4G4b/xwNdhG/tD+lAbihnWdMGzzchRVi9vWP1zFX
         u0hnUjX93BursVzy8LFHByOMwsJBaabu7Q8axerIS1+igj592/dWCOG5OaKDafbzcSxB
         N8gi+W7ySewFG9JitVzhJtln4Grvw0hBTp9lvTzLO3sRs65UJ9TEt+WqY1o+c04jGo8j
         NPfg==
X-Forwarded-Encrypted: i=1; AJvYcCW0oUWbnDJWGaeoeVuAuTZUlbFjZVWA1bp51yZ6YCLZzxGN3ZiF0HZfDiZYBNtoMwiZFCIE40lhAdJPnMuDqXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOLQqRt6fmJ//bzKSWzdyYQWioAL9F5Ii+/Od3+USdqv/qq1Ka
	nWzc/aYyuXFEzjLCVqHnigaoOkQlCv+qQcUN2x1BbZHx1CjZ2v9FGOkXqFQnISmuNw==
X-Gm-Gg: ASbGncvZlwn9Lxdcu5sJ2Cn3aHzArRUEzDrnQjNsjAtr+ikCSRYofSrd9oTrDfKXwDg
	yqNl1YKfdUNz8s6ff4Q3Yq9uEVp7HUcjn+sw9NCOafW9ytUPzWLU01L8y/fKDRlskbK6foHBlwF
	bjdCfINyd0ua5aksFcV2xo1EzlF0vtSaWOq2YKPSssEyXm7PrQBLOuGvybgh52DFeDfs2MgSmvt
	9HRbOM2T8uLCZuDY2hK9+tuOIpzdoUJUjA5VIYQWIUCKc0ZpsUGM2KunBdNPTUQCa4ncSiJWssW
	76z9m7nwBHScGvfrk/dhMNcahjxn2HZ9EOgV7OJ+xYkF8c8tPM5Ea90GClmimsrPNo0LERhdMXg
	cdyfCyrdDl0TXJV4O1lRi5C14wZgX2RyAKbybmtWpm+fqss0zCtgHxd/w5YD4D5BJuN4016wNZ8
	kz57YWGCBBlJMXHf1w8xN+IGOhqQ==
X-Google-Smtp-Source: AGHT+IHAsNuWRWXVS8F39M4Ez7vI9awJWnYUKY3l+nueilNqWU85goauwFdZbCUk64fIqas7l1J5Aw==
X-Received: by 2002:a17:907:96a4:b0:b04:25e6:2dc2 with SMTP id a640c23a62f3a-b07c254393cmr187747966b.22.1757659676933;
        Thu, 11 Sep 2025 23:47:56 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:47:56 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 0/4] USB Type-C alternate mode priorities
Date: Fri, 12 Sep 2025 06:47:47 +0000
Message-ID: <20250912064751.1987850-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a mechanism for setting USB Type-C alternate
mode priorities. It allows the user to specify their preferred order for
mode selection, such as USB4, Thunderbolt, or DisplayPort.

A new sysfs attribute named 'priority' is exposed to provide user-space
control over the mode selection process.

This series was tested on a Android OS device running kernel 6.16.

Changes in v4:
- replaced sprintf with sysfs_emit
- changed priority to u8
- added an overflow check to typec_mode_set_priority(), now returning
-EOVERFLOW on failure

Andrei Kuchynski (4):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 ++++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 46 +++++++++++++--
 drivers/usb/typec/class.h                   |  1 +
 drivers/usb/typec/mode_selection.c          | 62 +++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  5 ++
 include/linux/usb/typec.h                   |  2 +
 include/linux/usb/typec_altmode.h           |  1 +
 9 files changed, 126 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.384.g4c02a37b29-goog

