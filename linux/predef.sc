// Imports
import $ivy.`org.typelevel::cats-core:2.1.1`, cats._, cats.implicits._
import $ivy.`org.scalatest::scalatest:3.0.8`,org.scalatest._
import $ivy.`org.scalacheck::scalacheck:1.14.0`
import $ivy.`io.monix::monix:3.1.0`
import $ivy.`dev.zio::zio:1.0.0-RC18`
import $ivy.`com.github.nscala-time::nscala-time:2.26.0`
import $ivy.`org.typelevel::cats-effect:2.1.2`
import $ivy.`com.github.chocpanda::scalacheck-magnolia:0.3.1`
import $ivy.`io.chrisdavenport::cats-scalacheck:0.2.0`
import $ivy.`net.ruippeixotog::scala-scraper:2.2.0`
import $ivy.`com.softwaremill.sttp.client3::core:3.1.9`
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.concurrent.Future
import scala.util.{Failure, Success}
import scala.concurrent.Await
import org.scalacheck.{Arbitrary, Gen}
import com.github.nscala_time.time.Imports.DateTime
import com.github.nscala_time.time.Imports.DateTimeFormat
import org.scalacheck.magnolia._
import net.ruippeixotog.scalascraper.browser.JsoupBrowser
import net.ruippeixotog.scalascraper.dsl.DSL._
import net.ruippeixotog.scalascraper.dsl.DSL.Extract._
import net.ruippeixotog.scalascraper.dsl.DSL.Parse._
import sttp.client3._
