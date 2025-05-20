Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E557266592
	for <chrome-platform@lists.linux.dev>; Tue, 20 May 2025 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757108; cv=none; b=PQtTXwh9q1untK4A2djcMAVmUXSDv4H9nmtVG51KNtLi7ZfvvZCXZxU5tm8nqjm3DKA5yo2B2ODZrBbpMwU2Mb8ZvTYqv/VARjd+F61RbZbBVMzWVFVA+h6g699CxRkoTEpV07fD7BaQxRgCu2dt4SbfAAZjEQs7X5oIJBdqoVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757108; c=relaxed/simple;
	bh=cg5t4eGdtgZu3cXZP54MB4IR+ZBOuN5oWKa4yPo3uQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSoUQlfmu5tavX0EM11E5c4zx8oCUFbtxSEB4evF8INApi+Ur+pVzPYYdxQ0QxemS4sxkjPRlfsQz//nI75ey+6FRoKriGyE6YA2syQqpUrNSX5XVDcowq4SaYogMcBqd21ytfpu5Llxs/0rCWujchy7U9LxwPnlVua5EJejjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ynSqPFTB; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ynSqPFTB"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c559b3eb0bso385304885a.1
        for <chrome-platform@lists.linux.dev>; Tue, 20 May 2025 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747757105; x=1748361905; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO/nLRYCjfKcpLfeuNbV08YkbzqqQcf229Ms7HqssNo=;
        b=ynSqPFTBoIS8B63dWkuA0JwNMhjTzRU0dzTERRFhKW6q6udnTqHFMaa5Ic2ISgyeZo
         kLecbmNyS3/PmG0DOcR17XCVoPqjY6M2uac1lF+T4N9Cz+M+bX55I5lbJo94dAZ7/Cod
         EXVncQM9xtULFk5UtysfIUfPso4uFk2m1iJZslVynAt1VUKRnS9UtpYMd5QMxKNMzg3e
         DzIg3VZ9oCBdOBlTqW9AdPHq8Jwwm83NOz9WPXKnhXAtBuklbkxujuv0Q0PQNrIPSwFW
         P77s+Yln4gn2+ROamdvGVWhQsC9HxfIeJFZ4xhK09kskjFsDhMNJ2qEtfYpjbDZY48Bl
         tDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757105; x=1748361905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HO/nLRYCjfKcpLfeuNbV08YkbzqqQcf229Ms7HqssNo=;
        b=h8avcP57kIBZ/dsekt+3mVGw7P9323frM89t0xfuPJV2Oa+30JEnxrtQOv7ZrviRsD
         LUsvgAtB0G1urhFoKsiWdKZNASzwY0FIGzEl8IobON1uR/vpmkChKM6SM5ynZcPi/mU1
         A+9n29M98Sp6Ptx/sq/HJSHTv7AQkoSgqafKkmyGxbImt3JLQmvtfNmYCzF1InSTPb6Z
         0ziB9dIQ6cRKAisHW+7cetcTAal1RiZIPWkP2mfhJGSjTfsq8Bm26LTxc3rCzsKYmJse
         c2EBQfNDOC8MqJjkig5KUj6zFM2MrOpqsqnma1CzLeBQKDzIbiR9UI4JfMi2E/6cWMWd
         omQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTNPDvbVRXGUCrNv76Fe0gAcaYNPjdKQpZGrGPPADB1F/I8T5f9X9baBvPzM1yEtCPykHsDwVS5W8htx9kuY8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4roM4IKTIjtAztRi5jHWfCe4HdJv0SNXPPN1sAjNVI8tfE47u
	f5sBQBGq6zdOEZ3eTdp4EL6L5sWYhaSDRvXHSwwGTvAULe8aoyBritn93yP1jVNIqvNM03fLwX3
	EQdkv0O46MnegfcY39LH+6C/VuzKXwSe6mxvDQei4
X-Gm-Gg: ASbGnctQBsgjQj4X+hYg+C38fSLLCTF0l5W8eqjBWvNCu1egs9bLDyObukEktUmVaYe
	wDbGytofFDzN44l5qhB4HI3N9XwKCpYMgi0NOy2kllpkor4b1Z5k8hYvTVi2uU+3jOsnLwgDFsB
	00aZtwGfsFaKtmejThg06SKm/PDffTtWFXiPberp8aFlXMcOonjr0GO7WuzI8EkGJnJsYIsbKoR
	vs=
X-Google-Smtp-Source: AGHT+IEctazZU95TAdOM2Py70rzLbXXswnML189iWNcKKej+1E4sE5RLKNbUjCL/eh0PGvC9pd8HdYPKfxppky5e+CI=
X-Received: by 2002:a05:620a:394e:b0:7c5:4088:e48c with SMTP id
 af79cd13be357-7cd46731a86mr2518057385a.29.1747757104799; Tue, 20 May 2025
 09:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520082435.2255639-1-tzungbi@kernel.org>
In-Reply-To: <20250520082435.2255639-1-tzungbi@kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 20 May 2025 09:04:53 -0700
X-Gm-Features: AX0GCFs4NJkMHkJZuPMpivpKDaXRV49LM_WCCI_dDOeQOPacWqE-V5WduNyzJJk
Message-ID: <CAGS_qxrcH0+mJTO4nJqXnk2Bh7oO_PEur=ytcxL8wxJNCu20Tw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] platform/chrome: Add Kunit tests for protocol
 device drivers
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, brendan.higgins@linux.dev, davidgow@google.com, 
	rmoar@google.com, rostedt@goodmis.org, mhiramat@kernel.org, naveen@kernel.org, 
	anil.s.keshavamurthy@intel.com, davem@davemloft.net, 
	chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:25=E2=80=AFAM 'Tzung-Bi Shih' via KUnit Developme=
nt
<kunit-dev@googlegroups.com> wrote:
>
> The protocol device drivers under drivers/platform/chrome/ are responsibl=
e
> to communicate to the ChromeOS EC (Embedded Controller).  They need to pa=
ck
> the data in a pre-defined format and check if the EC responds accordingly=
.
>
> The series adds some fundamental unit tests for the protocol.  It calls t=
he
> .cmd_xfer() and .pkt_xfer() callbacks (which are the most crucial parts f=
or
> the protocol), mocks the rest of the system, and checks if the interactio=
ns
> are all correct.
>
> The series isn't ready for landing.  It's more like a PoC for the
> binary-level function redirection and its use cases.
>
> The 1st patch adds ftrace stub which is originally from [1][2].  There is=
 no
> follow-up discussion about the ftrace stub.  As a result, the patch is st=
ill
> on the mailing list.
>
> The 2nd patch adds Kunit tests for cros_ec_i2c.  It relies on the ftrace =
stub
> for redirecting cros_ec_{un,}register().
>
> The 3rd patch uses static stub instead (if ftrace stub isn't really an op=
tion).
> However, I'm not a big fan to change the production code (i.e. adding the
> prologue in cros_ec_{un,}register()) for testing.
>
> The 4th patch adds Kunit tests for cros_ec_spi.  It relies on the ftrace =
stub
> for redirecting cros_ec_{un,}register() again.
>
> The 5th patch calls .probe() directly instead of forcing the driver probe
> needs to be synchronous.  In comparison with the 4th patch, I don't think
> this is simpler.  I'd prefer to the way in the 4th patch.
>
> After talked to Masami about the work, he suggested to use Kprobes for
> function redirection.  The 6th patch adds kprobes stub.
>
> The 7th patch uses kprobes stub instead for cros_ec_spi.
>
> Questions:
> - Are we going to support ftrace stub so that tests can use it?
>
> - If ftrace stub isn't on the plate (e.g. due to too many dependencies), =
how
>   about the kprobes stub?  Is it something we could pursue?

Quick comment,
If I recall, the thought process was that we could consider it in the
future if there was enough demand for it.

We have these drawbacks with the current ftrace stubs:
* doesn't compile on all arches
* silently doesn't work on inlined functions <=3D=3D scariest one to me
* is more complicated and has more dependencies

So it felt like the better move to go with static stubs which has none
of those drawbacks (works on all arches, all functions, and is dead
simple) as opposed to simultaneously introducing two ways to do the
same thing.

You mention you don't like how static stubs requires modifying the
code-under-test.
Since it gets eliminated by the preprocessor unless you're compiling
for KUnit, is the concern more so about how it conceptually feels
wrong to do so?
For the Android GKI kernel, they have (or had) KUnit enabled so there
is potentially concern about real runtime cost there, not sure if you
have something similar in mind.

But stepping back, ftrace_stubs technically require modifying the code
to make sure funcs are marked as `noinline`, which this patch series
does not do.
I've not looked at cros_ec_{un,}register() to check if they're at risk
of inlining, but wanted to call that out, that ftrace stubs
technically don't handle your usage pattern 100% properly.

>
> - (minor) I'm unsure if people would prefer 'kprobes stub' vs. 'kprobe st=
ub'.
>

I'd personally vote for kprobe_stub.

Daniel
