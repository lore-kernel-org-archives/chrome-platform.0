Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276971;
	b=XkcexCjWJTt+0rmPhOFFJXFMO60bDIMxIHvYGbnriqL6XZgkZyb0Ab7yIRlC/Lysx6qT
	 bCGvCMOdDUaBTferer1sATG57hBXxwrwf/MgEuurMfvjfdQtVqEFOmEl6gRRFDk/e9eYu
	 o2sJK6PNpdM7HlHEFf7kBDCnADcbxvq5Hw/5RUnBU9ZY7IgbVFojZUku8Qa8Plfrw9ne9
	 UxvjxrguWiZda/fuOycyKtUaZ6lqMtQ+7SeKnBtoUek6BhlTojmer5GFo7mXLe5Pk9n20
	 V4I7aL1yvBMsrczyGE6dc/z3AcxqnJ9aBsjHvW45hy+eOI+FuRFDqEDa6FR/7M5UQxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
	b=MvuTpoBb9ticlzjzj89YKg+CBWJQiL+i1l/lqQv69rGJSRzaqaAwPivWOeTxKwYWL4Wc
	 H+qdkuP0Wh3r5WISHheKtS+XPaFjdyRkGekx8mfe+1n0tRErZyIoZJwOaza2iDkvoUN+z
	 SdWbK+fEsSrA1CO5vprqXvBZKvcRYUk7GVZRg3Ch9QMseSUZkmatGn664zBaV+fOep43N
	 WW63jAIN+guvRfVYThZEREeJBsVOkyfctbiv76b+9prSbjQ6yQfHM4JMtdKE8RP7nams2
	 OqWDVYj3QGQWK3Hpzo2WZk1oNqhUo0GRef/igFsA3kmyaeV51OFSQb9JhHyPen4mtIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PXkmUxeY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1649606A31C
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 12:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1649606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PXkmUxeY
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so940413a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 05:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276970; cv=none;
        d=google.com; s=arc-20260327;
        b=Gs1J798kh9l7Mjmb8h4/ARBT9jO1v3THahS5R1U3A0L4xk2UUPTPrt3drlwZFEo0m0
         rc4yxbQnESrSogBVmMKTQ69iFadNajuk+XB+AT9rqRubKpoyveUjYtuZiiNQ5NvWoJZa
         iPjM/k0fuQCXZD+RojmFkLPDp9HWv87rB/Aet8mge0X8DRnCFnEivE05qrTQMDmhfYks
         ZpMymiQpKLoLyrnNyQToppdOQ5m0+QAFwVx5WHa14+MKKVcZFxzNFFy6jGnozRxFq49i
         CeaWkHAhbCdetV8poo/2JN5eWbIRCTfBP2m0Y3DjKhb23lw2LcCAhCtWpZDmWdm65SXP
         SVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
        fh=5EmxdA30GdIbi2frDvgVMIgw9AXSiA5oeOktmu4BrHY=;
        b=qY0A0Lg+/ENGcyeaDj7EnoG1PYbm5uLYGBrOjKBvTWz6nqomcKyLIzRyraER3bh7wT
         3/Y5dFBHvwirPfL82jVl+uLkyXuo8JhNzDuryy/k5FGVuGM2qZpeHcrfHwFA263Xe9ud
         w9T7i8mzrPqaU3TI86RakxsLRRBCSudAId4CbPG2V7Zx8uBDevDXmDzYilS1ETSLhuT1
         aFiRyfa+970+Ic29F0pz32ALvXrnE+fSatEkqHK1aik+pT5q3jiFscEIS2Pnh3sYO09M
         mqAmYxh74YICE17ZxkEspQBPvHrVjdNjJZdv15T4k5/rXn+MOCHqWLvf9TOM1TqcPT7Z
         lEGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793276970; x=1793881770; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
        b=PXkmUxeYYSmI+3DEjrhK/Hn58VIVSZUo1QfP7QsXDKK3Dl/sZbnf2FMB/f+VBhtvAX
         OJS0ZIlGjSnoyiq23uWPXOyb7le+fL9KYfwj3YNhttbg+Bn1LKJaNNc+KNHY/QQ+S3V1
         iMsgHYtxT7ESSGdEri3EnyxDC06AKezRztwhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276970; x=1793881770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
        b=1dh+jyVtXMzUJaK59C3kId4w8yC3sKiigXisiDkqri7nQWFZ31bpiexPqZCAO4nf2v
         /QLUIj5M7Uhsp2mnu4/E8nBrCCXQNkCG1wIKbkH+mlzYqXYzYA3MVn3IM69GssCaFlRI
         ETdBMXRfknXjE+4/fi6bDkxdjHlaPQtmLkn+CUydBj12KoI1ktT5nxNLr60W6TT9nbpL
         zA48jiFLfrU90h/mML47sDWuSKpWBHz0+XaGaiy4V//yHfv9stcSQ1J1lEzMrzgc3Vfz
         GNbpJskOx5rGx4DStj/4D4ZfZoA5z5e8NFNO9xffpCCXWrBH11MY0ZB/4JDh9KwcYcvs
         kwGg==
X-Forwarded-Encrypted: i=1; AKwUvBzrvVfezey6hSsgRkTcr27zqEP8z9ifU2dqchq1+FJdZpxdlaYZiG2m1kPPvk+b+Ra2bnfrYrGDmkBj1L6eqKM=@lists.linux.dev
X-Gm-Message-State: AFq9FYK/im4x7qVnwrGagiuoYBsKUtyiiX7coAXeOj3cZtGExc86CwqA
	aMJjHb/macySyCNV3ClCEiEkZ4DqtvGEre2qLVFrlT9OCD3zoF7yOxboJmeXP1vspV/A0FDe/Lp
	CYagZH9k/2iAfEMl1TRD3b7VlXMlnL4SubgzmtOBZ
X-Gm-Gg: AYBFou07hEt90Dpyl70hDGJ6IsMVB5OoJpyAo1+KxhS6U4b2Czy+0AmEteASRoM/DH9
	a8vyy1xBrbMB2o5dYK1gkiCwRWMy7D+ZGNDJeWivM87hMSbHGiiMdk+W3+EidiRhXDQOYfLIjfi
	oqEYDZhiZnmTZTvRxwOfuxm7IVDufBbsYQOpkSno4+jQD5yab6E94787JZzZYqHrQdRa0wH0v2D
	T+FTTyyjB5b16X8pf3zi6cmsyA7CPB0idyoxvPr2bh0C5KT5sHRo2ZNt8gwhhL0heF6Mz3jEbVU
	h3+HBo5I10FT05CVNXYEJhuBB9hiKY6z3CHxXlq/4ddGRryBHjJs9Mr+kuNXOE2ZNNECWkPqr1N
	Jy+leo5J+NeqV+ofRQ7zp/aGj9WOwTeG9gCOBBkfkFi01fYv9sd4WZHXWWzZYENWWqKnWmLWmXQ
	29Hyfc82Dgrnhg
X-Received: by 2002:a17:90b:17c2:b0:3ad:1da4:2ddf with SMTP id
 98e67ed59e1d1-3ae581bbdcbmr4025636a91.51.1793276970075; Thu, 29 Oct 2026
 05:29:30 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028090932.27053-1-akuchynski@chromium.org>
 <20261028090932.27053-2-akuchynski@chromium.org> <auLJPLArIkwFHtRj@google.com>
In-Reply-To: <auLJPLArIkwFHtRj@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 29 Oct 2026 13:29:19 +0100
X-Gm-Features: AclHuK_RSupfL4YZ78wkRsLm46Vbx_c27Y8V7hlLCoBtIthQ5W1xvuqo9H7JdTg
Message-ID: <CAMMMRMdjzbUL0CqkWdxaerm=Bmf6oCPJU3TMtgXCgDqTTMGT4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:19=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, Oct 28, 2026 at 09:09:31AM +0000, Andrei Kuchynski wrote:
> > The driver sets mode_selection bit for each Alternate mode, thereby
> > preventing individual altmode drivers from activating their respective
> > modes.
> > Once the registration of all Alternate Modes is complete, the driver
> > verifies if USB4 mode is supported by both the port and the partner and
> > activates USB4 mode. In cases where USB4 is not supported, the driver
> > invokes typec_mode_selection_start to initiate the mode selection proce=
ss
> > based on mode priorities.
> > The driver communicates the current Type-C mode to the mode selection
> > process via typec_altmode_state_update.
>
> Hi Andrei,
>
> I'm less familiar with the details of cros_ec_typec and its friend driver=
s.
> Could you double-check the Sashiko review [1] to see if any of the findin=
gs
> need to be addressed as they look real?
>
> [1] https://sashiko.dev/#/patchset/20261028090932.27053-1-akuchynski%40ch=
romium.org

Hi Tzung-Bi,

Let's analyze this.
1. "If the EC does not enter TBT mode=E2=80=A6 Does this leave the port mux
configured in TBT mode and skip calling cros_typec_altmode_exit() to send
TYPEC_CONTROL_COMMAND_EXIT_MODES to the EC?"

It seems it does. Unclear if this causes actual issues, though this is
unrelated to mode_selection. The identical behavior occurs when altmode
activation gets triggered through sysfs by a user.

2. =E2=80=9CWithout calling typec_partner_set_usb_mode(), port->partner->us=
b_mode
is never updated to USB_MODE_USB4=E2=80=9D

This is a good one. I will update it in v4.

3. =E2=80=9CIf cros_typec_remove_partner() has already set port->partner =
=3D NULL,
this dereferences a NULL pointer=E2=80=9D

Also a valid point.
However, this is unrelated to mode_selection. The race condition between
cros_typec_altmode_work() and cros_typec_remove_partner() is addressed
here:
https://lore.kernel.org/all/20261018023438.3902617-1-mhun512@gmail.com/
Execution of cros_typec_altmode_work needs to be halted prior to partner
teardown.

In any case, I will test this against these considerations.

Thanks,
Andrei
