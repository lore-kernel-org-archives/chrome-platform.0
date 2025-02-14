Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3954427540F
	for <chrome-platform@lists.linux.dev>; Fri, 14 Feb 2025 05:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739509220; cv=none; b=tuUgTW9zjA6bLxZxZlr4Gz6IwrOxyJiBx7c/S1VlrBh5hOT5CJaxqvC0ctgP6VvgGiL8J4K/g32RvuyTtJxd+nnK79chY+/cgyIwZw2e1Micq0NTcQXwXIbf9hoNUCHq6+vYT1w+QaMTzgmGWfC/5ZGpoBx93XuMalOu4tBXfkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739509220; c=relaxed/simple;
	bh=vbdETyikUR5JbTLpV0R2K1qAGcKIrROi4Bw/liFgZUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bnei/27Q194AelLcDFKONRTciCGV2Whk76NhyH6isLGQ7T49/k9aZHNc4K7HVpJg3169fGqAJZOOE34HmFQnVvbPcbpbrr0ePRiD7vVPvkFQp1JBsJY6DcAWETcIOWqCc2nn/KUv4bNpGTn48f2nLbxeyMokC1vS2FzOTGRgEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=EEQCCIqa; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="EEQCCIqa"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f44353649aso2473247a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 13 Feb 2025 21:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1739509218; x=1740114018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/++DXT7iXjEz/Ie4ytENPK+rqUX5FsWdLmvL15E6dU=;
        b=EEQCCIqaR0g5SFAo46nNfAZO3MtJ/CYWJJZCclBl85f4hf7c6iNR7ktxO+SKBdf3gs
         ucYNyAsAC4OATM1Dw4LGGn+5olcQTE/CdBF5EgZeu6BhLeKXD8uTrYsDYBugpFtwGucD
         y6xPt9e43RflDhQ/2QZmK9JXB5hIO0iwCca+auIe7w+V8SfAY2ejkFFArP4kMduhXXQ/
         A/JlQV88R+Yv5Sn3Rk7RI48h4nbSglwgzwv8FsG5uPW7V9rSMhmiVSoZFglxfZkY8RXs
         g7zOdVmJyBvk+o3DUX7XH3j6JvI2pGIdWQe6LbfgewGhC7SEaDoDMlToEIpyT016QAU1
         H7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739509218; x=1740114018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/++DXT7iXjEz/Ie4ytENPK+rqUX5FsWdLmvL15E6dU=;
        b=Q2FKVuCXj/uS5lpr2l45pE5q2PkggPITsF/V/udieeUOvYc1gKgRKbZS5aZJP39+0h
         WATYUCbtKDBGLscOWz3vNKV6ZNGALJ2kqcGFidEYME4lC+iM6OOnJC+mBGqWTqsKSMCf
         amImkuztnsNuwMz3NAwHGGB5XQh7vNpdMu0DL7n8QsGJN1q8alXQQOcrzwQwiWvhjDdi
         d3A0OUfgBkrt7cMtv1l2wP4YtwYWfrY3wrKe+JAmR9xlK9SLIw9lJ6o3xjd/JR0f6D0N
         1N2XGdmxPWNwfZu77cfWu817mQLpv/rvYJbZAxRF1i5GVxXybgGnnhxq+JwDdkxR3RwT
         vYlg==
X-Gm-Message-State: AOJu0Ywml3ILP+kfq8Mcv1lOaLZCJzDXGkE/mdmpuayIwQ/B5WG1tSaJ
	a9260r+mdqa5jt6h3Rbv+i2s4NHYD5WxUbN1tioA7D96RetLl2BtpfqQSBlPfmf/q6ctsxka0Eu
	+2TrLCayhpUt5eW6rGLmrngxRKOpXn/XHODlORg==
X-Gm-Gg: ASbGncuAE7lj3NZXOdgIByAcUxysY19BrSeyVRgAABhoDWVwb5wfzVTwQvJKpVb8Qdb
	/ulZJFUaS0Dpdt+eD61HsR6S1nuHRDgqnKA/2B+p2M56zGuuRkWYmMZurVm3kK/Zs0+6dfrVe
X-Google-Smtp-Source: AGHT+IFpanC3HM1A45SdY2LGwijvj7p3iVoSTDIaUfJew34HM34EuSu0D0tqMQKn4B649ipQzsXcO4m82OxYuZsU5L8=
X-Received: by 2002:a17:90b:1949:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-2fbf8f58de6mr14521372a91.17.1739509218099; Thu, 13 Feb 2025
 21:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250128181329.8070-1-dhs@frame.work> <Z6AtlW7FwEwHMztW@google.com>
In-Reply-To: <Z6AtlW7FwEwHMztW@google.com>
From: Daniel Schaefer <dhs@frame.work>
Date: Fri, 14 Feb 2025 13:00:07 +0800
X-Gm-Features: AWEUYZl3geIuV4v8swBgVThjmOP6XceP_VbDwF475KLLsE1I9Ri8j_itKWIFt3c
Message-ID: <CAAjcXz5WbmKPWoL4Nsx17E+bcgDd1Y6qcbfifVu5A+S86MQZsQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_lpc: Match on Framework ACPI device
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux@frame.work, 
	"Dustin L . Howett" <dustin@howett.net>, Alexandru Stan <ams@frame.work>, bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

> I believe it's a typo.  Fixed s/FRMWC006/FRMWC004/ in the commit message.
Oh yes that's right, thanks.

Is there a chance this can still get into 6.14? I see it just barely
missed going into your for-6.14 - is that right?
6.14 will be included in the upcoming releases of Fedora 42 and Ubuntu
25.04 and we'll need it for some of our upcoming products.

Thanks,
Daniel


On Mon, Feb 3, 2025 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, Jan 29, 2025 at 02:13:29AM +0800, Daniel Schaefer wrote:
> > Load the cros_ec_lpc driver based on a Framework FRMWC006 ACPI device,
> [...]
> > > sudo dmesg | grep cros_ec_lpcs
> > [   17.521972] cros_ec_lpcs FRMWC004:00: loaded with quirks 00000001
> > [   17.534012] cros_ec_lpcs FRMWC004:00: Chrome EC device registered
>
> I believe it's a typo.  Fixed s/FRMWC006/FRMWC004/ in the commit message.
>
> > [...]
>
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux=
.git for-next
>
> [1/1] platform/chrome: cros_ec_lpc: Match on Framework ACPI device
>       commit: d83c45aeec9b223fe6db4175e9d1c4f5699cc37a
>
> Thanks!
