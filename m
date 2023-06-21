Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F815BE
	for <chrome-platform@lists.linux.dev>; Wed, 21 Jun 2023 03:25:34 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5728df0a7d9so44501137b3.1
        for <chrome-platform@lists.linux.dev>; Tue, 20 Jun 2023 20:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20221208.gappssmtp.com; s=20221208; t=1687317933; x=1689909933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3Zs6MLRUmQ4jLIZW4S3+UmqZ8y5JLZT1L1tiX/RTEQ=;
        b=NB/uP8u674Ot6ycCfDCPK9/J64D4gxn9mebVPqI9c+jImJ7keghhIeo/PEnwN4UFBi
         nJUPJ04y/zI90fUX0RZmoOHQ+0YYoG9smNBRJna6sjub1zeNwYKf+LP2EuHgEI3Empse
         UZCRd1QjE1kBoqQGddRrRnYpSO+KpEPXLJ90X8KDGEtmm6XDdVHHHNd8EYBZY+XUjjiA
         KlHfkMTQmv8K84IenZXGebC0TYGuFv3D5xHJF5/8XIGCj+bK29XSo3irkHjsFFMLwggd
         IUyHecB61agc1TAR6XaY9UpN3fvviOLeecAzLx05L53TdyuHtXue8tr7Jogyy6TJMRZG
         US3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687317933; x=1689909933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3Zs6MLRUmQ4jLIZW4S3+UmqZ8y5JLZT1L1tiX/RTEQ=;
        b=UfrxdxReEA1HAYHbj1q801+bcikfa55Do0u1vI9EkEou28iSdx8RuAq5pQu3KNcqQI
         rNZjeHZjITa1D8c1NSpVElLTLJu7SlXXvy1iPMj64F4fqqFxq4tloZYqM8g+UJzwk2p/
         xjJM9LeQQzPnh520oVTLO399YlTv2x0OvHUPNZaypZUo5hawWQ/nl1M8imzWAll/ANU0
         85gLWvWbTNDBOBCPKYHLWPnWJruP59F83i60oeii9xXQ+w54A3P23Zhc/4TJYGxcoa5j
         9rQxiI307Bhm/bDsmdIAf29euXzBoh/H1Gg7HOxEAmN0bwEcR0otSVtfXuLx3jyaSPdo
         wepg==
X-Gm-Message-State: AC+VfDyTOW5de2+syX7a0PPAT5eq6m2x49fbXdiBr1Noow81rC1IB6tf
	rjhi2sM0492F/QwBQcRkMhcnG9XVOnca1llI4OC0mw==
X-Google-Smtp-Source: ACHHUZ6KEk3Ic0iY4FOoRYOSG67XmpTcFakS69QDsGJRYKtzpfs3d2GptSOJhsc0CRU/5CTpJn4LcUUNr9P21v+BVAU=
X-Received: by 2002:a0d:ea91:0:b0:56c:fce5:ac38 with SMTP id
 t139-20020a0dea91000000b0056cfce5ac38mr15316010ywe.14.1687317933490; Tue, 20
 Jun 2023 20:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
In-Reply-To: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
From: Dustin Howett <dustin@howett.net>
Date: Tue, 20 Jun 2023 22:25:22 -0500
Message-ID: <CA+BfgNKDXBfU_d46geMvOHsidASHvLWoCHkC+9Bu-ay-Tr+Dwg@mail.gmail.com>
Subject: Re: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
To: David Rheinsberg <david@readahead.eu>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,
I've been investigating this exact phenomenon with the team over at Framewo=
rk
Computer!

I can't comment on the EC ceasing to function (as I've only observed gentle=
r
failure states[^1] on the 11th and 12th generation Intel Core 13" laptop), =
but
that is an interesting outcome. What system and EC firmware versions are yo=
u
using on that device?

On those devices, it occurs because exchanges from cros_ec_lpcs collide on =
the
bus with exchanges initiated by ACPI. There is a trivial locking mechanism =
used
by the ACPI control methods for EC communication, but it cannot be shared w=
ith
the host OS.

Excerpting a post of mine[^2] on the Framework Community Forum:

> The power and battery state of the machine are managed by ACPI, and the A=
CPI
> methods for querying those things call the EC directly. When it does so, =
it
> uses a mutex that can=E2=80=99t be shared with the OS. There=E2=80=99s al=
so a couple
> ACPI-driven exchanges that occur during wake from sleep. Now, because
> cros_ec_lpcs (Linux) and CrosEC (Windows) use the LPC bus directly, an in=
flight
> request from ACPI can collide with an inflight request from one of these
> drivers.

Incidentally, their lead firmware engineer filed a similar bug[^3] on
my Windows EC
driver bearing the same interface as cros_ec_lpcs.

We don't currently have any leads on a permanent solution, but some members=
 of
the community forum are testing out placing the cros_ec_debugfs driver on t=
he
list of disallowed modules. Doing so reduces the chatter on the host comman=
d
interface, since it no longer needs to query the console periodically.

Cheers,
Dustin

[^1]: On those devices, the media keys stop working. Everything else contin=
ues
to work fine, including the host command interface and therefore the consol=
e.

[^2]: https://community.frame.work/t/tracking-fn-key-stops-working-on-popos=
-after-a-while/21208/49

[^3]: https://github.com/DHowett/FrameworkWindowsUtils/issues/3
