Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31653A5
	for <chrome-platform@lists.linux.dev>; Tue,  7 Feb 2023 16:12:39 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id u9so11851795plf.3
        for <chrome-platform@lists.linux.dev>; Tue, 07 Feb 2023 08:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20K67K9edwRh0ZAf2p1ADQD2Xsmwqcm4t/xw8k9j5dk=;
        b=AoF+pK17KeWga6/gfHCf5yHbKRSGJFnueL7IsWIbszgBvma2IhRB52/8yoPorV3frY
         0tz93kpERxaUv//F2L5fpiY6l2QIZbFFUkipoOSwguDJluQgAMUzqDoXam4zbwgixYZX
         a8Q/34uIhjyoJ7hHEh9NbFk4EvLT4Nk6wMybk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20K67K9edwRh0ZAf2p1ADQD2Xsmwqcm4t/xw8k9j5dk=;
        b=gdUoxN4EmKzDHtdpn/a87kObQ6RaSHDN2a2B4J4s7xWU+nBR9k+DPA0ttln9Og5sML
         HyiwLreUYR1fXsHadR5ta8tsZnmXo8UNY0qoGYponDXfIs3i0TfhUlUItxYC74ksP/Dl
         tZl9AyFpUEGkhtMQcCXbIN9nCgTjyx5bOBADbVHHipRP6oZ8vbWHqopqpkHpwF7XECVb
         1YbMARoqfDZevJc9mpVJBjDZvyXtd5KQCXZo1XwObQAm9NBnSvqd1bR/tjBXavYJY4AL
         WGRKyjiKtb/vNLIT8vK4QznUKpkSQ85c70P78GAKmnWez/3rwDJP3jVbsfDqOkWTCoDw
         bqeQ==
X-Gm-Message-State: AO0yUKWI/miHVB02wMwGtzZtb8pwhUwBaYKrVo0TvOKDWaGKtc+Zuc/v
	yhKzM9etyxTOSOjcSEypQOQSEA==
X-Google-Smtp-Source: AK7set/18UhSh4y8tsQvk2Wb2TNH4BmdUcUYZKUCiuZ1gvdK/0bx2qtjXyO98XA9L1w3+ObchL8DFA==
X-Received: by 2002:a17:903:1252:b0:198:adc4:22a2 with SMTP id u18-20020a170903125200b00198adc422a2mr17215569plh.29.1675786358610;
        Tue, 07 Feb 2023 08:12:38 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902c1c400b00186a2dd3ffdsm9082889plc.15.2023.02.07.08.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 08:12:38 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julius Werner <jwerner@chromium.org>,
	David Gow <davidgow@google.com>,
	Jack Rosenthal <jrosenth@chromium.org>,
	chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: coreboot: Remove GOOGLE_COREBOOT_TABLE_ACPI/OF Kconfig entries
Date: Tue,  7 Feb 2023 08:12:00 -0800
Message-Id: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since commit a28aad66da8b ("firmware: coreboot: Collapse platform
drivers into bus core") the Kconfig entries GOOGLE_COREBOOT_TABLE_OF
and GOOGLE_COREBOOT_TABLE_ACPI have been dead. They have no "help"
text and thus aren't user choosable. They also aren't "select"ed by
anything. They also control the compilation of no code.

Let's remove them.

Fixes: a28aad66da8b ("firmware: coreboot: Collapse platform drivers into bus core")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/firmware/google/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 9f190eab43ed..1bc7cbf2f65d 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -44,14 +44,6 @@ config GOOGLE_COREBOOT_TABLE
 	  device tree node /firmware/coreboot.
 	  If unsure say N.
 
-config GOOGLE_COREBOOT_TABLE_ACPI
-	tristate
-	select GOOGLE_COREBOOT_TABLE
-
-config GOOGLE_COREBOOT_TABLE_OF
-	tristate
-	select GOOGLE_COREBOOT_TABLE
-
 config GOOGLE_MEMCONSOLE
 	tristate
 	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
-- 
2.39.1.519.gcb327c4b5f-goog

