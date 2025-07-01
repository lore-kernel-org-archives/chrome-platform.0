Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED742253A4
	for <chrome-platform@lists.linux.dev>; Tue,  1 Jul 2025 05:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347382; cv=none; b=pZkzhxvm/j4X9F5kiOpr6Nt2uABgfVvDtlNa5kbs05GTzkQfzvOXi/7XDnLy9uy3cR9hs4er513o9JgBzdBNPgz9Q3cCBzPFMLIUEJuZqitDk5BwUtOezgcOF7R0gy5ufQNC+KXV63KVi4h+Zm0ah3Mj+tLMnDHcxkhWJS+chb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347382; c=relaxed/simple;
	bh=5/JwVEuz/UpsEESScBGzFxUIa7q8yQbIgcrUrStPkRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDSvNmZUFoGtaZcUK+j82SS55kkFMstiig3MfZGU0N92PmmUn6bUaEZsKeTsqRrJv5eYK3ftUSQCd4xno5zp3wspovQ99zDS6vDAW6exTeo+ykeDKUbEV6/Kd3Ja7uvJLdlThDCleUtu3laifFjyvXWo/bK4Sz1B3THtRWqRbRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yk2EnTsO; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yk2EnTsO"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad3400ea3so47078496d6.0
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751347379; x=1751952179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWbnuDQEG4ZG51rhVoXd9l74zp2+Y+DpuK1YGU3B97M=;
        b=yk2EnTsOp0vq876+k3ZbUyoBCIK/frMpHRhv6ll8QdKwGHgBhgGjEhvm+qOcWsdBuZ
         hKgIJGzrIehKS9NCSWQpZ74NKQP5emTRwPFBJqILToX4oCoduftzn8QTlNi6kkLSV+Oe
         yIWF7pHtfdIql/pR6nlJ7IVjACiioYyqfHqTJF05Z81itlhxTbZAUdxPKXbaaEwSsSNG
         LGrLnZTDaUUpfJ2n343je7o8ONvicmtJjpSVIFW6r468ATGXbrHnOdF0pYiBPX+XeOUf
         l7oeWz75h72SG9I9qinQkmh7cjUeHWEdpeu6l/PLiJptsiBlhqKADHJo6isiMDAdJ4tG
         pkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751347379; x=1751952179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWbnuDQEG4ZG51rhVoXd9l74zp2+Y+DpuK1YGU3B97M=;
        b=W4DW/SGZGjVTmDijXr1mt7+OKSu1SizAFXBTI5HQzAUa+2dChihCk2I60opPKuzKmA
         ik65ggCRrq7+whTtLRJA+jxUPzONdFEYUFJ8/YlH8J6+tVs1M5OztLeViyKgVYz8fGVp
         Yb3rWqlzaOcH9x9ZaoihJXEXvW0QqVq2hUwGj0GLTSbzr3LMIeCbnnWCq+7eEP+pVq8M
         Pq/6YyXTo0q+228Z6OpRSyKRWGxtEWeNRZvXn76xPjjdHsRL0ooesrPSglBScGBZGx4E
         vscFtRX3nOG9kowYLx6S4FLL4XZXpOv7IGZWaDWOwAqmrdBxgFSNzvu7Mr+7zD0/lVMx
         Dxug==
X-Forwarded-Encrypted: i=1; AJvYcCU3evkGGQa9X2K7yUMZvsubcsmNv7XmduK5ezpJewQOlOchfwFof40pT0aQLlPbzal0d5/phDGeeMR5goPN4Cs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYyhv/uNmnX09MLzjnAA5h2GW9yQg43B/fbyOgTyR3+YnhWV5t
	yPZuqZpI6gUv94GbfBp1+MYbKUhlEhGI87BeURS40Waiul9+dlSVaFdXibr0KQ9gHpcqAUjyz+J
	su3p+FSW/2dGicgCXkG5g4y/m4GMFhi/SnMN1zqm8
X-Gm-Gg: ASbGncueTwXC/z8hQOhL8wIJn6a3aIbyFZBeS8sUoUF/zvmlGOb/E3WfwPGfPzTid2y
	vok+wOA3ddnqwF9jGXfpmgCD7D7LqNnPYl1w6nvtRqyg/8ssZDB8+luDl3kzYAgyFPNiPdpPvI1
	EKT1nyNMkHS0QM9OaUesah+htpQhSMt6yXNhlBJY7QqlTk
X-Google-Smtp-Source: AGHT+IGpzxDBrBogoKoyLkPPHM6iDSYvJhIuC7y6ZVpwiIprRtjwSBjJSKv3onzP0yROztlsN5fAxejSDBAAeoyetgE=
X-Received: by 2002:a05:6214:5007:b0:6fd:ace:4cf8 with SMTP id
 6a1803df08f44-700035b781dmr234492016d6.30.1751347373427; Mon, 30 Jun 2025
 22:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520082435.2255639-1-tzungbi@kernel.org> <CAGS_qxrcH0+mJTO4nJqXnk2Bh7oO_PEur=ytcxL8wxJNCu20Tw@mail.gmail.com>
 <aGIvjrrSRPJQpNy7@google.com>
In-Reply-To: <aGIvjrrSRPJQpNy7@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 1 Jul 2025 14:22:40 +0900
X-Gm-Features: Ac12FXxgYKxYb9vyVEWPlAfSA3bOrsnLZpveKjlL5T8zEbkPuStK5k7jGoQ6Uo0
Message-ID: <CAGS_qxpqQ1Z5QOxmXoXQyFBygdfW+1R=g9f=bbJo54Ex8LA7Kw@mail.gmail.com>
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

On Mon, Jun 30, 2025 at 3:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 09:04:53AM -0700, Daniel Latypov wrote:

(snip)

>
> > We have these drawbacks with the current ftrace stubs:
> > * doesn't compile on all arches
> > * silently doesn't work on inlined functions <=3D=3D scariest one to me
>
> I see. I did some experiments and realized that kprobe stubs also share
> the same concern. Thus I'm wondering if there is a way that kprobe stub
> detects the redirection may fail, at least it can skip the test case
> (e.g. register_kprobe() returns -ENOENT when it can't find the symbol
> via kprobe_lookup_name()). But it seems no way if the target function
> is partially inlined.

Yeah, any such approach will need to be cautious of inlining, so
they'd have to always be "for power users only: only use this if you
understand the risk"
Skipping when we can detect the user is obviously doing the wrong
thing makes that a *bit* more palatable.

It's not like static stubs can detect at runtime if you've failed to
add the necessary corresponding KUNIT_STATIC_STUB_REDIRECT() either,
for example.

But I still personally lean slightly against adding either kprobe or
ftrace stubs, see below.

>
> > You mention you don't like how static stubs requires modifying the
> > code-under-test.
> > Since it gets eliminated by the preprocessor unless you're compiling
> > for KUnit, is the concern more so about how it conceptually feels
> > wrong to do so?
> > For the Android GKI kernel, they have (or had) KUnit enabled so there
> > is potentially concern about real runtime cost there, not sure if you
> > have something similar in mind.
>
> Not exactly. Ideally, I think we shouldn't modify the CUT. I'm wondering
> if there is a way to not change the CUT but also break the external
> dependencies.
>
> > But stepping back, ftrace_stubs technically require modifying the code
> > to make sure funcs are marked as `noinline`, which this patch series
> > does not do.
...
> They could be partially inlined even though they are exported symbols.

So to summarize, right now we're stuck with having to modify the code.
(Unless someone can come up with something really clever, but not too cleve=
r)

To make it concrete, the current approach would look like:

int func(char* arg1, int arg2) {
  KUNIT_STATIC_STUB_REDIRECT(func, arg1, arg2);
  ... // unchanged
}

vs an ftrace/kprobe approach that needs a conditional `noinline`

KUNIT_STUBBABLE int func(char* arg1, int arg2) {
  ... // unchanged
}

The latter is definitely simpler and less burdensome.
But I don't know if it's simpler enough to warrant a second
implementation existing for me personally.

E.g. we already have some people who justifiably say it's too hard to
figure out KUnit, so this is another decision point where a user might
get stuck with "how should I know which one I should use?" and give
up.

Compatibility tangent:
A smaller annoyance is KUNIT_STATIC_STUB_REDIRECT and KUNIT_STUBBABLE
are incompatible (and always will be?)

E.g. imagine a func has KUNIT_STUBBABLE on it, but a person authoring
a new test wants needs to run without kprobe support, so they must add
KUNIT_STATIC_STUB_REDIRECT.
I can imagine an author deciding to make the func have *both* macros on it.=
..
That feels like a worst case outcome from the perspective of "we
shouldn't modify the CUT just for the sake of tests" :\

To be clear, the right approach in this scenario is to 1) swap to
KUNIT_STATIC_STUB_REDIRECT and update the previous tests to use static
stubs, 2) then add your new tests.
But I can imagine that won't always happen, esp. if it crosses
maintainer boundaries.
